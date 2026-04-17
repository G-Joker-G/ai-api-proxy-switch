# Project Structure

```
ai-api-proxy-switch/
├── SKILL.md                    # Skill metadata and main documentation
├── README.md                   # English documentation (main)
├── README_zh-CN.md            # Chinese documentation
├── QUICKSTART.md              # Quick start guide
├── CONTRIBUTING.md            # Contribution guidelines
├── LICENSE                    # MIT License
├── .gitignore                 # Git ignore rules
├── install.sh                 # Installation script
├── troubleshoot.sh            # Troubleshooting script
├── docs/                      # Detailed documentation
│   └── DETAILED_GUIDE.md     # Comprehensive technical guide
├── examples/                  # Usage examples
│   ├── config.env.example    # Environment configuration example
│   └── usage-examples.sh     # Example usage scripts
├── references/                # Reference materials
│   ├── config-guide.md       # Configuration guide
│   └── quick-setup.sh        # Quick setup script
└── scripts/                  # Scripts directory (currently empty)
```

## File Descriptions

### Core Files
- **SKILL.md**: The main skill file containing metadata, triggers, and usage instructions for Hermes Agent.
- **README.md**: Primary English documentation with overview, installation, and usage instructions.
- **README_zh-CN.md**: Chinese version of the documentation.
- **QUICKSTART.md**: Quick start guide for new users.
- **CONTRIBUTING.md**: Guidelines for contributing to the project.
- **LICENSE**: MIT License file.
- **.gitignore**: Git ignore rules for the repository.

### Scripts
- **install.sh**: Automated installation script for easy setup.
- **troubleshoot.sh**: Diagnostic tool for troubleshooting common issues.

### Documentation
- **docs/DETAILED_GUIDE.md**: Comprehensive technical documentation covering all aspects of the skill.

### Examples
- **examples/config.env.example**: Example environment configuration file.
- **examples/usage-examples.sh**: Shell script with various usage examples.

### References
- **references/config-guide.md**: Detailed configuration guide.
- **references/quick-setup.sh**: Quick setup script for initial configuration.

## Skill Structure for Hermes Agent

When installed in Hermes Agent, the skill follows this structure:
```
~/.hermes/skills/software-development/ai-api-proxy-switch/
├── SKILL.md                    # Loaded by Hermes Agent
├── references/                 # Accessible via skill_view()
└── scripts/                   # Can be executed by the skill
```

## Development Notes

1. **Skill Metadata**: All skill metadata is defined in SKILL.md frontmatter.
2. **Documentation**: Keep documentation in sync across all language versions.
3. **Examples**: Examples should be tested and working.
4. **Scripts**: All scripts should have proper error handling and comments.
5. **References**: Reference materials should be kept up-to-date with API changes.

## Adding New Files

When adding new files:
1. Update this PROJECT_STRUCTURE.md file
2. Add appropriate documentation
3. Update README.md if necessary
4. Test the new functionality

## File Naming Convention

- Use lowercase with hyphens for file names (e.g., `config-guide.md`)
- Use descriptive names that indicate content
- Keep file extensions consistent (.md for markdown, .sh for scripts)
- Avoid spaces in file names