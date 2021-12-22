set /p filename=Please Input filename(tmp No .cpp):
echo   the file will be compiled is :%filename%
g++ -fexec-charset=GBK %filename%.cpp -o %filename% -std=c++14
%filename%.exe
type .\debug\out.txt
pause>nul