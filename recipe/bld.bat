%PYTHON% -m pip install . --no-deps -vv

IF NOT EXIST %PREFIX%\condabin GOTO END
COPY %PREFIX%\bin\mamba.exe %PREFIX\condabin\mamba.exe
:END