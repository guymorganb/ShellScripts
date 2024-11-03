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


# Development Environment Setup Scripts

This repository contains a collection of shell scripts to set up a complete development environment on Ubuntu. These scripts handle the installation and configuration of essential development tools including SDKMan, NVM, Oh-My-Zsh, Java, Maven, and Node.js.

## Prerequisites

Ensure you're running Ubuntu and have basic tools installed:
```bash
sudo apt-get update
sudo apt-get install -y curl git build-essential
```

## Installation Scripts

### 1. SDKMan Installation
```bash
chmod +x install_sdkman.sh
./install_sdkman.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### 2. NVM Installation
```bash
chmod +x install_nvm.sh
./install_nvm.sh
source "$HOME/.nvm/nvm.sh"
```

### 3. Oh-My-Zsh Installation with Optional Powerlevel10k
```bash
chmod +x install_oh-my-zsh.sh
./install_oh-my-zsh.sh
```
During installation, you'll be prompted:
1. Whether to install Powerlevel10k theme
2. Whether to install the recommended MesloLGS NF fonts

After installation:
```bash
exec zsh
```
If you installed Powerlevel10k, follow the configuration wizard that appears.

## Post-Installation Setup

### Installing Java 20
After installing SDKMan, run:
```bash
sdk install java 20.0.2-open
sdk use java 20.0.2-open
```

Verify installation:
```bash
java -version
```

### Installing Maven
Using SDKMan:
```bash
sdk install maven
```

Verify installation:
```bash
mvn -version
```

### Installing Node.js 18
Using NVM:
```bash
nvm install 18
nvm use 18
```

Verify installation:
```bash
node --version
npm --version
```

## Terminal Configuration

If you installed Powerlevel10k and MesloLGS NF fonts:
1. Set your terminal emulator's font to "MesloLGS NF"
2. If needed, run `p10k configure` to reconfigure your prompt

## Verifying All Installations

Run these commands to verify everything is installed correctly:
```bash
# Java
java -version

# Maven
mvn -version

# Node.js
node --version
npm --version

# SDKMan
sdk version

# NVM
nvm --version
```

## Troubleshooting

### SDKMan Issues
- If `sdk` command is not found, try:
  ```bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  ```

### NVM Issues
- If `nvm` command is not found, try:
  ```bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  ```

### Oh-My-Zsh Issues
- If the Powerlevel10k font doesn't display correctly:
  1. Verify "MesloLGS NF" is set as your terminal font
  2. Run `p10k configure` to reconfigure
  3. Restart your terminal

## Updates

To keep your tools updated:
- SDKMan: `sdk upgrade`
- NVM/Node.js: `nvm install node --latest-npm`
- Oh-My-Zsh: `omz update`
- Powerlevel10k: `git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull`

## Additional Resources

- [SDKMan Documentation](https://sdkman.io/usage)
- [NVM GitHub Repository](https://github.com/nvm-sh/nvm)
- [Oh-My-Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)

