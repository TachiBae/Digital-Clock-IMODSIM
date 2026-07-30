# Activity 1 – Digital Clock

A Flutter widget that replicates a 7‑segment style digital clock: live `H:MM`
time, small seconds subscript, AM/PM indicator, full date, and day of week —
all updating in real time.

## Specifications Met

- **Model – Digital Clock**: Replicates the reference clock layout (large
  hour:minute digits, small seconds, AM/PM, date, day of week) in green on
  black.
- **Simulation**: The clock updates every second via a live `Timer`, so
  minutes and seconds change automatically as time passes — no manual input
  required.

## Files

| File                  | Purpose                                                             |
|------------------------|----------------------------------------------------------------------|
| `main.dart`            | App entry point. Loads a black `Scaffold` centering the clock.       |
| `activity1_clock.dart` | The Activity 1 widget — assembles time, date, AM/PM, and day labels. |
| `digital_clock.dart`   | Reusable 7‑segment digit/colon painters used to draw the big digits. |

## How to Run

### Option A — Run online (no installation needed)
1. Go to [zapp.run](https://zapp.run) and create a new Flutter project.
2. Replace/add the three files above into the `lib/` folder.
3. Click **Run**. The clock will render directly in the browser.
4. Share the generated project link — anyone with the link can view and run
   it instantly, no downloads required.

### Option B — Run locally
Requires [Flutter](https://docs.flutter.dev/get-started/install) installed.

1. Create a new Flutter project or clone this one:
   ```
   flutter create activity1_clock
   ```
2. Copy `main.dart`, `digital_clock.dart`, and `activity1_clock.dart` into
   the project's `lib/` folder (replacing the default `main.dart`).
3. Get dependencies and run:
   ```
   flutter pub get
   flutter run -d chrome
   ```
   (You can swap `chrome` for any connected device/emulator.)

### Option C — Deploy as a web link
1. Build the web version:
   ```
   flutter build web
   ```
2. Push the contents of `build/web` to a `gh-pages` branch on GitHub (or any
   static host).
3. Share the resulting URL — it opens directly in any browser.

## Notes

- Date and day labels use the system `monospace` font. For a closer match to
  a true LCD/digital font, add a font such as **Digital‑7** to `pubspec.yaml`
  and update the `fontFamily` in `activity1_clock.dart`.
- The clock always reflects the **current system time** — it will not show
  the exact date/time from the reference image, since it's a live simulation
  rather than a static replica.
