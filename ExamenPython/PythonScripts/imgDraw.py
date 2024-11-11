import cv2  
import numpy as np 

def drawImage():
    path = r'img/car.png'
    imagenRead = cv2.imread(path) 
    window_name = 'Image'    
    width = 400
    height = 300  
    img = np.zeros((height, width, 3), np.uint8)   
    p1 = (100, 200) 
    p2 = (50, 50) 
    p3 = (300, 100)   
    cv2.line(img, p1, p2, (255, 0, 0), 3) 
    cv2.line(img, p2, p3, (255, 0, 0), 3) 
    cv2.line(img, p1, p3, (255, 0, 0), 3)   
    cv2.rectangle(imagenRead, (5, 5), (220, 220), (0, 255, 0),2)
    cv2.circle(imagenRead,(120, 50) , 20, (255, 0, 0) , 2)        
    cv2.imshow(window_name, imagenRead) 
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    cv2.waitKey(1)
     
        

drawImage()