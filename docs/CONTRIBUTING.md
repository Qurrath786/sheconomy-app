# Contributing to SHEconomy

## Development Workflow

### Branch Naming Convention
- `feature/feature-name` - New features
- `bugfix/bug-description` - Bug fixes  
- `hotfix/critical-fix` - Critical production fixes
- `docs/documentation-update` - Documentation updates

### Commit Message Format
type(scope): description

body (optional)

footer (optional)

**Types**: feat, fix, docs, style, refactor, test, chore

**Example**:
feat(auth): add Google Sign-In functionality

Implemented Google Sign-in using Firebase Auth

Added Google sign-in button to login page

Updated authentication service

### Pull Request Process
1. Fork the repository
2. Create feature branch from `develop`
3. Make your changes
4. Write/update tests
5. Update documentation
6. Submit pull request to `develop` branch

### Code Review
- All code must be reviewed before merging
- Ensure tests pass
- Follow coding standards
- Update documentation if needed

Added proper error handling

Closes #123
