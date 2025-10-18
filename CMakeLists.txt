cmake_minimum_required(VERSION 3.10)
project(SampleIME)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Source files
set(SOURCES
    src/ActiveLanguageProfileNotifySink.cpp
    src/BaseDictionaryEngine.cpp
    src/BaseWindow.cpp
    src/ButtonWindow.cpp
    src/CandidateListUIPresenter.cpp
    src/CandidateWindow.cpp
    src/Compartment.cpp
    src/Composition.cpp
    src/CompositionProcessorEngine.cpp
    src/DictionaryParser.cpp
    src/DictionarySearch.cpp
    src/DisplayAttribute.cpp
    src/DisplayAttributeInfo.cpp
    src/DisplayAttributeProvider.cpp
    src/DllMain.cpp
    src/EditSession.cpp
    src/EndComposition.cpp
    src/EnumDisplayAttributeInfo.cpp
    src/EnumTfCandidates.cpp
    src/File.cpp
    src/FileMapping.cpp
    src/FunctionProviderSink.cpp
    src/GetTextExtentEditSession.cpp
    src/Globals.cpp
    src/KeyEventSink.cpp
    src/KeyHandler.cpp
    src/KeyHandlerEditSession.cpp
    src/KeyStateCategory.cpp
    src/LanguageBar.cpp
    src/Register.cpp
    src/RegKey.cpp
    src/SampleIME.cpp
    src/SampleIMEBaseStructure.cpp
    src/ScrollBarWindow.cpp
    src/SearchCandidateProvider.cpp
    src/Server.cpp
    src/ShadowWindow.cpp
    src/StartComposition.cpp
    src/TableDictionaryEngine.cpp
    src/TextEditSink.cpp
    src/TfInputProcessorProfile.cpp
    src/TfTextLayoutSink.cpp
    src/ThreadFocusSink.cpp
    src/ThreadMgrEventSink.cpp
    src/TipCandidateList.cpp
    src/TipCandidateString.cpp
    resource/SampleIME.rc
)

# Header files (for IDE support)
set(HEADERS
    include/BaseDictionaryEngine.h
    include/BaseWindow.h
    include/ButtonWindow.h
    include/CandidateListUIPresenter.h
    include/CandidateWindow.h
    include/Compartment.h
    include/CompositionProcessorEngine.h
    include/Define.h
    include/DictionaryParser.h
    include/DictionarySearch.h
    include/DisplayAttributeInfo.h
    include/DisplayString.h
    include/EditSession.h
    include/EnumDisplayAttributeInfo.h
    include/EnumTfCandidates.h
    include/File.h
    include/FileMapping.h
    include/GetTextExtentEditSession.h
    include/Globals.h
    include/KeyHandlerEditSession.h
    include/KeyStateCategory.h
    include/LanguageBar.h
    include/Private.h
    include/RegKey.h
    include/resource.h
    include/SampleIME.h
    include/SampleIMEBaseStructure.h
    include/SampleIMEStructureArray.h
    include/ScrollBarWindow.h
    include/SearchCandidateProvider.h
    include/ShadowWindow.h
    include/stdafx.h
    include/TableDictionaryEngine.h
    include/TfInputProcessorProfile.h
    include/TfTextLayoutSink.h
    include/TipCandidateList.h
    include/TipCandidateString.h
)

# Create shared library (DLL)
add_library(SampleIME SHARED ${SOURCES} ${HEADERS} resource/SampleIME.def)

# Include directories
target_include_directories(SampleIME PRIVATE include)

# Preprocessor definitions
target_compile_definitions(SampleIME PRIVATE
    UNICODE
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(SampleIME PRIVATE _DEBUG)
else()
    target_compile_definitions(SampleIME PRIVATE NDEBUG)
endif()

# Copy dictionary file to output directory
add_custom_command(TARGET SampleIME POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
    ${CMAKE_CURRENT_SOURCE_DIR}/resource/Dictionary/SampleIMESimplifiedQuanPin.txt
    $<TARGET_FILE_DIR:SampleIME>/SampleIMESimplifiedQuanPin.txt
)
