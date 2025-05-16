
# _BLD_ - Build System

Build systems such as Maven and Gradle are great build systems if
you are building a simple, standard application.  You follow
their conventions, and building is automatic!  But, if you want
to build something complex or non-standard, things get really complex really fast.
Sometimes, the simplest variation over their standard configuration can
be inordinately complex or require all sorts of plugins.  Worse yet,
if the build process is complex enough, you find that parts of your application
are now embedded in your build process.  Thus, Maven essentially becomes part of
your application.

_BLD_ is a build system that is simple to use and simple to create custom processes.
It was extracted from the KISS open-source, full-stack, Java-based web development framework
available at https://github.com/blakemcbride/kiss.
_BLD_ is as simple as Maven when building applications that are simple to build.
But with _BLD_, it is far easier to add custom build processes to your application.

_BLD_ is smart, so it doesn't perform functions that are already done.  Your
build program specifies all the needed steps, but _BLD_ only actually executes
the steps necessary.

_BLD_ is portable to Linux, macOS, Windows, and other systems.

The sample tasks that come with _BLD_ mimic Maven's structure, so things will look 
familiar.  Currently, _BLD_ has only been used for Java applications.  But
there is no reason it couldn't be used with other languages.

_BLD_ includes the following files:

* builder/Tasks.java -  the application-specific build procedures (or tasks)
* builder/BuildUtils.java -  the generic utilities needed to build
* _bld_ - the program that drives the process (Linux, macOS, etc.)
* _bld.cmd_ - the Windows version of _bld_
* _builder/commons-compress-1.20.jar_ -  needed to extract jar files

## Usage

All interactions with the system are through the _bld_ script (or 
_bld.cmd_ in the case of Windows).  Except for Windows, you will normally
need to execute the _bld_ program with a leading _./_

The only file you should have to edit is the _Tasks.java_ file.

The following commands are supported:

* _bld help_ -  print a help message
* _bld list-tasks_ -  print a list of valid tasks
* _bld build_ -  build the application
* _bld run <full-path-of-class-to-run>  [argument]..._ -  run the application
* _bld jar_ -  build an application jar file
* _bld javadoc_ -  build javadoc files
* _bld libs_ -  download foreign jar files (normally done by other tasks)
* _bld clean_ -  remove the built files
* _bld realclean_ -  remove the built files and downloaded jar files
* _bld ideclean_ -  realclean + remove the IDE files

## Default Structure

With _BLD_, you can structure your system any way you like.  However, the
way it comes out of the box is as follows:

* _src/main/java_ -  the source root of your source code
* _libs_ - the directory for your local and foreign jar files
* _target/classes_ - the compiled classes
* _target/javadoc_ - the javadoc files
* _app.jar_ - the application jar file
* _builder_ - the _bld_ system files

## Requirements

* Java 8 or later

You do not need to build the system.  The system builds itself anytime something changes.

## Installation

There is an installation script (install or install.cmd) that can be used to install _bld_ into your application.


