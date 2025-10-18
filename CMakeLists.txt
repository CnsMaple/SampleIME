cmake_minimum_required(VERSION 3.10)
project(SampleIME)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Source files
set(SOURCES
    ActiveLanguageProfileNotifySink.cpp
    BaseDictionaryEngine.cpp
    BaseWindow.cpp
    ButtonWindow.cpp
    CandidateListUIPresenter.cpp
    CandidateWindow.cpp
    Compartment.cpp
    Composition.cpp
    CompositionProcessorEngine.cpp
    DictionaryParser.cpp
    DictionarySearch.cpp
    DisplayAttribute.cpp
    DisplayAttributeInfo.cpp
    DisplayAttributeProvider.cpp
    DllMain.cpp
    EditSession.cpp
    EndComposition.cpp
    EnumDisplayAttributeInfo.cpp
    EnumTfCandidates.cpp
    File.cpp
    FileMapping.cpp
    FunctionProviderSink.cpp
    GetTextExtentEditSession.cpp
    Globals.cpp
    KeyEventSink.cpp
    KeyHandler.cpp
    KeyHandlerEditSession.cpp
    KeyStateCategory.cpp
    LanguageBar.cpp
    Register.cpp
    RegKey.cpp
    SampleIME.cpp
    SampleIMEBaseStructure.cpp
    ScrollBarWindow.cpp
    SearchCandidateProvider.cpp
    Server.cpp
    ShadowWindow.cpp
    StartComposition.cpp
    TableDictionaryEngine.cpp
    TextEditSink.cpp
    TfInputProcessorProfile.cpp
    TfTextLayoutSink.cpp
    ThreadFocusSink.cpp
    ThreadMgrEventSink.cpp
    TipCandidateList.cpp
    TipCandidateString.cpp
    SampleIME.rc
)

# Header files (for IDE support)
set(HEADERS
    BaseDictionaryEngine.h
    BaseWindow.h
    ButtonWindow.h
    CandidateListUIPresenter.h
    CandidateWindow.h
    Compartment.h
    CompositionProcessorEngine.h
    define.h
    DictionaryParser.h
    DictionarySearch.h
    DisplayAttributeInfo.h
    DisplayString.h
    EditSession.h
    EnumDisplayAttributeInfo.h
    EnumTfCandidates.h
    File.h
    FileMapping.h
    GetTextExtentEditSession.h
    Globals.h
    KeyHandlerEditSession.h
    KeyStateCategory.h
    LanguageBar.h
    Private.h
    RegKey.h
    resource.h
    SampleIME.h
    SampleIMEBaseStructure.h
    SampleIMEStructureArray.h
    ScrollBarWindow.h
    SearchCandidateProvider.h
    ShadowWindow.h
    stdafx.h
    TableDictionaryEngine.h
    TfInputProcessorProfile.h
    TfTextLayoutSink.h
    TipCandidateList.h
    TipCandidateString.h
)

# Create shared library (DLL)
add_library(SampleIME SHARED ${SOURCES} ${HEADERS} SampleIME.def)

# Include directories
target_include_directories(SampleIME PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

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
    ${CMAKE_CURRENT_SOURCE_DIR}/Dictionary/SampleIMESimplifiedQuanPin.txt
    $<TARGET_FILE_DIR:SampleIME>/SampleIMESimplifiedQuanPin.txt
)
