# python批量更换后缀名
import os
import sys
os.chdir(r'D:\\tridu33\\Golog\\Knowledge in ActionEbook\\kia')

# 列出当前目录下所有的文件
files = os.listdir('./')
print('files',files)

for fileName in files:
	portion = os.path.splitext(fileName)
	# 如果后缀是.txt
	if portion[1] == ".txt":
		#把原文件后缀名改为 pl
		newName = portion[0] + ".pl" 
		os.rename(fileName, newName)
