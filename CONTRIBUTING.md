# Contributing

Thanks for taking the time to contribute.

## Reporting issues

- Search existing issues before opening a new one.
- Use the provided issue templates.
- Include DevEco Studio version, HarmonyOS SDK/API version, device model and a minimal reproduction.

## Pull requests

1. Fork the repository and create a topic branch from `main`.
2. Keep changes focused; avoid unrelated refactors in the same PR.
3. Follow the existing ArkTS style and directory conventions.
4. Verify the project builds in DevEco Studio and describe how you tested it.
5. Update `README.md` / `docs/ARCHITECTURE.md` when behavior or structure changes.
6. Use clear commit messages, preferably [Conventional Commits](https://www.conventionalcommits.org/).

## Code conventions

- Put pages in `entry/src/main/ets/MainAbility/pages/` and reusable UI in `component/`.
- Put data models in `model/` and runtime configuration in `common/AppConfig.ets`.
- Do not hard-code backend URLs, credentials or personal data in components.
- Keep comments meaningful; remove commented-out code before submitting.
- Do not add new permissions without documenting why they are required.

## Security

Never commit:

- signing certificates, profiles or passwords (`*.p12`, `*.cer`, `*.p7b`, keystores);
- `local.properties`, IDE metadata or build outputs;
- API keys, access tokens or personal information.

Report security issues privately through GitHub Security Advisories instead of opening a public issue.
