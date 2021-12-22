set /p filename=Please Input filename(tmp No .cpp):
echo   the file will be compiled is :%filename%
g++ %filename%.cpp -o %filename% -std=c++14
%filename%.exe
type .\out.txt
pause>nul