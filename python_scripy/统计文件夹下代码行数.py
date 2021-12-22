# -*- coding:utf-8 -*-
import os

ROOT_PATH = r'D:\\SoundAbstraction'
COUNT_TYPE = ['py'] # 'java','xml'
if __name__ == '__main__':
    lines = 0
    for filepath, dirnames, filenames in os.walk(ROOT_PATH):
        for filename in filenames:
            path = os.path.join(filepath, filename)
            if len(filename.split(".")) < 2:
                continue
            filetype = filename.split(".")[1]
            if(filetype in COUNT_TYPE):
                count = len(open(path,encoding='UTF-8').readlines())
                print(path,",lines:",count)
                lines += count
    print("total count :",lines)