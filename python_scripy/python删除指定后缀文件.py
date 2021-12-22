import os
'''删除.txt文件'''  
path = "D:\\BaiduYunDownload\\"  
for maindir,subdir,file_name_list in os.walk(path):  
    for filename in file_name_list:  
        if(filename.endswith(".txt")):  
            os.remove(maindir+"\\"+filename)  
        else:  
            print("None")