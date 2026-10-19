# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-10-18

### Added

- Initial open-source release of the Palm NJUPT phone app.
- README with feature list, screenshots, build instructions and API contract.
- `docs/ARCHITECTURE.md` describing routing, components and data flow.
- Apache-2.0 license, contribution guide and GitHub issue/PR templates.
- `.gitattributes` for consistent line endings.

### Changed

- Renamed the application package from `com.example.work` to `com.palmnjupt.phone`.
- Centralized backend endpoints and demo credentials in `common/AppConfig.ets`.
- Updated application labels and descriptions for Chinese and English locales.
- Reformatted project metadata (`package.json`, lockfiles) for the new repository.

### Fixed

- Replaced invalid `fontSize(Color.Pink)` calls with `fontColor(Color.Pink)`.
- Removed an invalid `@Entry` decorator from the reusable `FourView` component.
- Removed unused imports, state fields and dead network requests.
- Corrected the “友情链接” comment typo.

### Removed

- Local signing configuration (certificate paths, encrypted passwords, profiles).
- Local SDK paths (`local.properties`), IDE metadata, `node_modules` and build outputs.
- Personal or machine-specific configuration from tracked files.
