%PYTHON% -m pip install . --no-deps -vv

IF NOT EXIST %PREFIX%\condabin GOTO END
COPY %RECIPE_DIR%\mamba.bat %PREFIX%\condabin\
:END