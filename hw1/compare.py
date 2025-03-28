from PIL import Image
import numpy as np
import sys

def compare_bmp(file1, file2):
    try:
        # Open images
        img1 = Image.open(file1).convert('RGB')
        img2 = Image.open(file2).convert('RGB')
        
        # Ensure both images are 256x256
        if img1.size != (256, 256) or img2.size != (256, 256):
            print("Error: One or both images are not 256x256.")
            return
        
        # Convert images to numpy arrays
        arr1 = np.array(img1)
        arr2 = np.array(img2)
        
        # Compare pixel values
        if np.array_equal(arr1, arr2):
            print("The images are identical.")
        else:
            print("The images are different.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python compare_bmp.py <image1.bmp> <image2.bmp>")
    else:
        compare_bmp(sys.argv[1], sys.argv[2])
