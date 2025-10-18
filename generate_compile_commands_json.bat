@echo off

if not exist .cache mkdir .cache && ^
echo 🏗️ Running CMake configuration... && ^
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_STANDARD=17 -G "Ninja" -B .cache -S . && ^

echo ✅ Finished generating compile_commands.json
