# SampleIME

This is a sample Input Method Editor (IME) for Windows using the Text Services Framework (TSF).

## Differences from Original

This project is a modified version of the IME sample from [Microsoft Windows Classic Samples](https://github.com/microsoft/Windows-classic-samples/tree/main/Samples/IME). The main differences are:

- **Directory Structure**: Reorganized directories including `include`, `src`, and `resource` for better organization.
- **Build System**: Changed from MSBuild to CMake for improved build configuration.

## Building

### Prerequisites

- CMake 3.10 or later
- A C++ compiler supporting C++17 (e.g., Visual Studio 2017 or later on Windows)

### Build Steps

1. Clone or download the project to your local machine.

2. Create a build directory inside the project root:

   ```
   mkdir build
   cd build
   ```

3. Generate the build files using CMake:

   ```
   cmake ..
   ```

   On Windows, this will generate Visual Studio solution files by default.

4. Build the project:

   ```
   cmake --build . --config Release
   ```

5. After building, the `SampleIME.dll` will be located in the build directory, and the dictionary file `SampleIMESimplifiedQuanPin.txt` will be copied there automatically.

### Notes

- Ensure that your development environment has the necessary Windows SDK components for TSF development.
- For more information on registering and using the IME, refer to the Windows Text Services Framework documentation.

## Registration

To register the IME, run the following command with administrator privileges:

```
regsvr32 SampleIME.dll
```

Note: Administrator privileges are required to register the IME.

To unregister the IME:

```
regsvr32 /u SampleIME.dll
```
