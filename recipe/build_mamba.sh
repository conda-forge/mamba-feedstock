set -euxo pipefail
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY=1"

if [[ $PKG_NAME == "libmamba" ]]; then
    cmake -B build/ ${CMAKE_ARGS}              \
        -GNinja                         \
        -DBUILD_LIBMAMBA=ON             \
        -DBUILD_SHARED=ON               \
        -DBUILD_MAMBA_PACKAGE=ON
    cmake --build build/ --parallel ${CPU_COUNT}
    cmake --install build/
elif [[ $PKG_NAME == "libmambapy" ]]; then
    export CMAKE_ARGS="-G Ninja ${CMAKE_ARGS}"
    $PYTHON -m pip install --no-deps --no-build-isolation -vv ./libmambapy
fi
