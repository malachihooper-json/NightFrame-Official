# NIGHTFRAME Repository Readiness Audit

Audit date: 2026-06-06

## Outcome

The directory is a Git repository on branch `main` tracking
`origin/main`. A portable core solution, pinned .NET toolchain, CI split,
citation metadata, license, editor settings, line-ending policy, and expanded
ignore rules have been added.

Validated in this environment:

- `dotnet restore NIGHTFRAME.Core.sln`
- `dotnet build NIGHTFRAME.Core.sln --no-restore --configuration Release`
- `dotnet run --project Drone --configuration Release --no-build -- --simulate --edge-cases`
- `npm ci` and `npm run build` in `gamma1-web`
- Pandoc HTML and DOCX export from `docs/WHITEPAPER.md`

## Fixed Clone-Portability Problems

| Problem | Effect on another user | Resolution |
|---|---|---|
| Directory initially lacked usable Git metadata | No branch/history/remote workflow | Established `main` tracking the GitHub origin |
| Root build mixed portable and Windows-only projects | macOS/Linux clone could not follow one reliable build path | Added `NIGHTFRAME.Core.sln`; retained all-project Windows solution |
| Drone was pinned to `win-x64` | Normal builds were not portable | Removed default runtime pin; publish RID is now operator-selected |
| Watchdog enabled AOT and `win-x64` for normal builds | Clone required Windows/AOT toolchain | Made AOT, self-contained, and single-file publishing opt-in |
| Android signing was unconditional | Release/debug build could require a missing private key | Signing activates only when a release keystore exists |
| Generated Python caches/databases/state were visible to Git | Machine-specific files could be committed | Expanded `.gitignore` |
| No SDK policy | Different SDK selection could change build behavior | Added `global.json` for .NET 8 |
| CI only ran one Windows solution build | Portable and web regressions were not separately visible | Added portable matrix, Windows legacy, and web jobs |
| Explicit vulnerable `System.Text.Json` package | NuGet reported a high-severity advisory | Removed redundant package reference |
| Frontend pinned vulnerable Next.js 16.0.8 | npm reported high-severity direct dependency findings | Updated Next.js and matching ESLint config to 16.2.7 |
| Root documentation overstated portability/readiness | New users could expect unimplemented production behavior | Rewrote root README with status and prerequisites |

## Why a Fresh Clone May Still Not Fully Work

### Platform and Privilege Dependencies

- `Agent3` and `GAMMA1Console` target Windows.
- Android requires the .NET Android workload, Android SDK/JDK, and private
  release-signing material.
- Hotspot, captive-portal, registry, modem, and gateway paths depend on
  platform capabilities, elevated permissions, hardware, and network policy.
- The Drone compiles cross-platform, but compiler warnings identify Windows API
  paths that require runtime guards and platform validation.

### Incomplete End-to-End Paths

- Result signatures are produced by nodes but not verified by the Orchestrator.
- Production consensus voting is not implemented.
- Model hydration and secure peer update distribution are incomplete.
- Prompt jobs do not complete through a validated tokenization/model/result
  decoding pipeline.
- Several discovery, gossip, and propagation behaviors are simulations or
  logged intentions rather than complete transports.

### Build and Dependency Residuals

- The portable core build succeeds with compiler warnings, including unfinished
  async paths, unreachable self-test code, unused fields/events, and
  Windows-only API reachability.
- `npm audit` reports two moderate findings inherited through the patched
  Next.js/PostCSS dependency tree. npm offers only a breaking/incorrect
  downgrade path in this lockfile.
- There are no conventional unit-test projects in the solution. The Drone
  contains embedded self-tests and simulations.
- Python training scripts do not have a pinned requirements or lock file and may
  require optional third-party packages.

### Runtime Configuration

- Orchestrator and Drone addresses default to localhost and must be configured
  for multi-machine use.
- Production TLS, authentication, authorization, CORS origins, secrets, and
  deployment endpoints are not fully configured.
- `vercel.json` contains an example Orchestrator destination that must be
  replaced for deployment.
- No model shard artifacts are included; ONNX execution falls back when a
  matching local shard is absent.

## Initial Publication Checklist

Before pushing to GitHub or depositing a release:

1. Review `git status` and commit the remaining publication files.
2. Choose repository visibility consistent with the proprietary `LICENSE`.
3. Configure GitHub private vulnerability reporting.
4. Push branch `main` and run GitHub Actions on Windows and Linux.
5. Create a versioned release and connect the GitHub repository to Zenodo.
6. Confirm author, date, license, and access settings in `CITATION.cff` and the
   Zenodo deposit form.
7. Export `docs/WHITEPAPER.md` and inspect the final PDF/DOCX visually.
