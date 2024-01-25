# Scaffold C/C++ Project Script

This shell script is designed to quickly scaffold a new C or C++ project structure. When executed, it will create a project directory with subdirectories that follow a common C/C++ project structure, along with necessary configuration files for VS Code.

## Prerequisites

To run this script, you need the following prerequisites installed on your system:

- Bash shell (typically available on Linux and macOS)
- `gcc` or `clang` compiler for building the project
- Git (if using repositories)

## Usage

To use this script:

1. Ensure the script is executable by running the command:
   ```
   chmod +x scaffold_C-C++_project.sh
   ```

2. Execute the script with the following command:
   ```
   ./scaffold_C-C++_project.sh
   ```

3. Follow the prompt to specify the project type (C or C++), root directory, and project name.

### Diagram of Scaffold Structure

Below is the directory and file structure created by the script:

```
project_name/
├── .vscode/                    # VS Code configuration files
│   ├── tasks.json              # Task definitions
│   ├── launch.json             # Debugger configuration
│   └── c_cpp_properties.json   # C/C++ properties
├── include/                    
│   ├── module1/                # Public header files
│   │   └── module1.h or .hpp
│   └── module2/
│       └── module2.h or .hpp
├── src/                        # Source files
│   ├── main.c or .cpp          # Main program file
│   ├── module1/                # Module 1 source files
│   │   ├── module1.c or .cpp
│   │   └── module1.h or .hpp
│   └── module2/                # Module 2 source files
│       ├── module2.c or .cpp
│       └── module2.h or .hpp
├── lib/
│   └── third_party_lib/        # Third-party libraries
├── bin/                        # Compiled binaries
├── obj/                        # Object files
├── test/                       # Test files
│   ├── test_main.c or .cpp
│   ├── module1/
│   │   └── test_module1.c or .cpp
│   └── module2/
│       └── test_module2.c or .cpp
├── doc/                        # Documentation
├── Makefile                    # Build script for the project
└── README.md                   # Project README
```

The script will check if the required compiler (`gcc` or `clang`) is installed, and it will also copy preconfigured VS Code template files into the project's `.vscode` directory.

### Important Notes

- Make sure to provide absolute paths when prompted for directories.
- You may need to manually configure the Makefile and VS Code templates for your specific project needs.
- Running the script will not initialize a git repository. If desired, you can run `git init` within the project directory after the scaffold is created.

## Contribution

Contributions to improve existing examples or add new ones are welcome. If you have a database backend setup that you'd like to share, please contribute by:

1. Forking the repository.
2. Creating a new branch for your contribution (git checkout -b new-database-feature).
3. Committing your changes (git commit -am 'Add some database feature').
4. Pushing to the branch (git push origin new-database-feature).
5. Creating a new Pull Request.

## Feedback and Contact

If you have any feedback, questions, or would like to get in touch, you can reach me at:

Email: [guymorganb@gmail.com]
LinkedIn: [https://www.linkedin.com/in/guymorganb/]
Instagram: [https://www.instagram.com/guyycodes/]




