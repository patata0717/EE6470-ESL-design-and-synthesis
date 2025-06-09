// improved
#include "tb.h"
#include <esc.h>                // for the latency logging functions
#include <string>
#include <algorithm>
#include <iostream>
#include <queue>

////
// The source thread reads data from a file and sends it to the design
////

struct Node {
    sc_uint<16> value;   // currV
    sc_uint<16> weight;  // currW
    sc_uint<8>  depth;   // next item index
};

void tb::source()
{
    // 1) Reset the DUT
    dout.reset();
    rst_out.write(0);  // assert reset (active low)
    wait(2);
    rst_out.write(1);  // deassert reset
    wait();
    din.reset();


    // 2) Open stimulus file and read header
    open_stimulus_file();            
    input_t header = read_stimulus_value_header();
    const sc_uint<8>  NUM_ITEMS    = header.range(39, 32);
    const sc_uint<16> WEIGHT_LIMIT = header.range(31, 16);
    std::cout << "[tb]Header:"  << " NUM_ITEMS=" << NUM_ITEMS  << " WEIGHT_LIMIT=" << WEIGHT_LIMIT  << std::endl;

    dout.put(header);


    std::vector<input_t> packets;          // full 64-bit packets (for DUT)
    std::vector<sc_uint<8>> V, W;          // value[], weight[] for TB’s search
    packets.reserve(NUM_ITEMS);
    V.reserve(NUM_ITEMS);
    W.reserve(NUM_ITEMS);

    for (int i = 0; i < NUM_ITEMS; ++i) {
        input_t pkt = read_stimulus_value();
        packets.push_back(pkt);
        V.push_back(pkt.range(15, 8));
        W.push_back(pkt.range(7, 0));
    }
    close_stimulus_file();


    std::vector<int> idx(NUM_ITEMS);            // permutation index
    for (int i = 0; i < NUM_ITEMS; ++i) idx[i] = i;

    auto cmp_ratio = [&](int a, int b) {
        return (sc_uint<16>)V[a] * W[b] > (sc_uint<16>)V[b] * W[a];
    };
    std::sort(idx.begin(), idx.end(), cmp_ratio);

    // 4) Stream MAX_ITEMS packets to the DUT
    //    (sorted items first, then zero-padded packets)
    //------------------------------------------------------------
    std::vector<input_t>   sorted_pkt;   sorted_pkt.reserve(NUM_ITEMS);
    std::vector<sc_uint<8>> sortedV;      sortedV.reserve(NUM_ITEMS);
    std::vector<sc_uint<8>> sortedW;      sortedW.reserve(NUM_ITEMS);
    for (int k : idx) {
        sorted_pkt.push_back(packets[k]);
        sortedV.push_back(V[k]);
        sortedW.push_back(W[k]);
    }


    //------------------------------------------------------------
    // 4) Stream exactly NUM_ITEMS packets to the DUT
    //------------------------------------------------------------
    for (int i = 0; i < NUM_ITEMS; ++i) {
        dout.put(sorted_pkt[i]);
        wait();  // wait for DUT to process
    }

    //------------------------------------------------------------
    // 5) Branch-and-bound search
    //------------------------------------------------------------
    std::queue<Node> work;
    work.push({0, 0, 0});     // root node
    sc_uint<16> best_value = 0;
    sc_uint<32> num_of_visits = 0;

    while (!work.empty())
    {
        //----------------------------------------
        // Pop next node & send to DUT
        //----------------------------------------
        Node n = work.front();
        work.pop();

        if (n.depth > NUM_ITEMS) {
            continue;
        }

        // Encode node → input_t   (fields outside [39:0] = don't-care)
        input_t node_pkt = 0;
        node_pkt.range(15,  0) = n.value;
        node_pkt.range(31, 16) = n.weight;
        node_pkt.range(39, 32) = n.depth;
        cout << "[tb]Pushing node: " << "V=" << n.value << ", W=" << n.weight << ", D=" << (int)n.depth << endl;

        dout.put(node_pkt);
        num_of_visits++;

        //----------------------------------------
        // Wait for UB / LB from DUT
        //----------------------------------------
        output_t res = din.get();      // blocking read

        sc_uint<16> LB = res.range(31, 16);
        sc_uint<16> UB = res.range(15,  0);
        cout << "[tb]Received bounds: " << "LB=" << LB << ", UB=" << UB << endl;

        if (LB > best_value){
            best_value = LB;   // improve incumbent
            cout << "New best value: " << best_value << endl;
        }

        //----------------------------------------
        // Prune if UB ≤ current best
        //----------------------------------------
        if (UB <= best_value) {
            cout << "Bounded by " << UB << " ≤ best_value " << best_value << ". Pruning." << endl;
            continue;
        }

        //----------------------------------------
        // Otherwise push children  (take / skip)
        //----------------------------------------
        sc_uint<8>  nextW = sortedW[n.depth];
        sc_uint<8>  nextV = sortedV[n.depth];


        // Child 1: take item if weight allows
        // Child 2: skip item
        work.push({ (n.value  + nextV), (n.weight + nextW), (n.depth  + 1) });
        work.push({ n.value, n.weight, (n.depth + 1) });
        cout << "[tb]Pushed children(currV, currW, depth): " << "V=" << (n.value + nextV) << ", W=" << (n.weight + nextW) << ", D=" << (int)(n.depth + 1) << endl;

        cout << "[tb]Pushed children(currV, currW, depth): " << "V=" << n.value << ", W=" << n.weight << ", D=" << (int)(n.depth + 1) << endl;
    }

    cout << "Best value found: " << best_value << endl;
    cout << "Number of nodes visited: " << num_of_visits << endl;
    cout << "time: " << sc_time_stamp() << endl;
    esc_stop();
}


////
// Open the stimulus file
////
void tb::open_stimulus_file( const char * _name )
{
    const char * name = ( _name == NULL ? "stimulus_20.dat" : _name );

    stim_file.open( name );
    if( stim_file.fail() )
    {
        cerr << "Couldn't open " << name << " for reading." << endl;
        exit( 0 );
    }
}

input_t tb::read_stimulus_value_header()
{
    unsigned int num_items, wlimit;
    stim_file >> std::ws;
    stim_file >> num_items >> wlimit;

    input_t value = 0;
    value.range(39, 32) = (sc_uint<8>)num_items;
    value.range(31, 16) = (sc_uint<16>)wlimit;
    return value;
}

input_t tb::read_stimulus_value()
{
    unsigned int weight, val;
    stim_file >> std::ws;
    stim_file >> weight >> val;

    input_t value = 0;
    value.range(15, 8) = (sc_uint<8>)val;
    value.range(7, 0) = (sc_uint<8>)weight;
    cout << "[tb]Read item: " << "W=" << weight << ", V=" << val << endl;
    return value;
}


////
// Close the stimulus file
////
void tb::close_stimulus_file()
{
    stim_file.close();
}
