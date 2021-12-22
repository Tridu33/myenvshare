
#include <stdio.h>
#include <iostream>
using namespace std;
//C++语法
int main(){
    int a,b;
    cout << "重定向debug/io.txt" << endl;
    freopen("debug\\in.txt","r",stdin); //输入重定向，输入数据将从in.txt文件中读取
    freopen("debug\\out.txt","w",stdout); //输出重定向，输出数据将保存在out.txt文件中
    while(cin>>a>>b)
    cout<<a+b<<endl; // 注意使用endl
    fclose(stdin);//关闭文件
    fclose(stdout);//关闭文件
    return 0;
}