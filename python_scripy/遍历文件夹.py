#遍历文件夹
import os
#待遍历文件目录
path = r"./"
#调用listdir，根据字母遍历path目录,返回列表数据
dirs = os.listdir(path)
# os.walk(top指定需要遍历的目录路径,topdown=True,onerror=None,followlinks=False)
#os.walk方法返回三元组：dirpath遍历的目录路径,dirnames目录下所有文件夹,filenames目录下所有文件
#输出所有的文件和文件夹
for file in dirs:
    print(file)










