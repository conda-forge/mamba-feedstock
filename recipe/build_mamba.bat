@echo ON

rem most likely don't needed on Windows, just for OSX
rem set "CXXFLAGS=%CXXFLAGS% /D_LIBCPP_DISABLE_AVAILABILITY=1"

if /I "%PKG_NAME%" == "libmamba" (
	cmake -B build/ ^
	    %CMAKE_ARGS% ^
		-GNinja ^
		-DBUILD_LIBMAMBA=ON ^
		-DBUILD_SHARED=ON  ^
		-DBUILD_MAMBA_PACKAGE=ON
        if errorlevel 1 exit 1
        cmake --build build/ --parallel %CPU_COUNT%
        if errorlevel 1 exit 1
        cmake --install build/
)
if /I "%PKG_NAME%" == "libmambapy" (
    	%PYTHON% -m pip install --no-deps --no-build-isolation -vv ./libmambapy
)
if /I "%PKG_NAME%" == "mamba" (
	cmake -B build/ ^
	    %CMAKE_ARGS% ^
		-GNinja ^
		-DBUILD_LIBMAMBA=ON ^
		-DBUILD_MAMBA=ON
        if errorlevel 1 exit 1
        cmake --build build/ --parallel %CPU_COUNT%
        if errorlevel 1 exit 1
        cmake --install build/
)

