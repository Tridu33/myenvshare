'''删除特定文件名的文件'''  
import os
path = "D:\\BaiduYunDownload\\"  
for maindir,subdir,file_name_list in os.walk(path):  
    for filename in file_name_list:  
        print(filename)  
        if filename in ["pngtobeDEL.png","beDEL.txt","beDEL.url"]:  
            os.remove(maindir+"\\"+filename)  
            print("ok")  
        else:  
            print("0") 