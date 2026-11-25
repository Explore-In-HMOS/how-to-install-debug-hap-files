import { ChapterInfo, GuideStep } from '../model/GuideModels';

export class GuideRepository {
  private chapters: ChapterInfo[] = [
    new ChapterInfo(0, 'Environment', 'Install DevEco Studio, SDK and signing prerequisites', 0, 13),
    new ChapterInfo(1, 'Developer mode', 'Enable developer settings and Wi-Fi debugging on your watch', 14, 21),
    new ChapterInfo(2, 'HDC and HAP', 'Connect, install, run and debug your signed HAP', 22, 35)
  ];
  private steps: GuideStep[] = [
    new GuideStep(
      0, 0, 'Environment',
      'Computer ready',
      'Use Windows or macOS supported by your DevEco Studio release.',
      'Check storage, network access, and a compatible HarmonyOS Smart Wearable.',
      '',
      'Do not follow SportWatch (Lite Wearable) deployment steps.'
    ),
    new GuideStep(
      1, 0, 'Environment',
      'Get DevEco Studio',
      'Open the official Huawei developer download page.',
      'Download a release supporting your watch HarmonyOS API and architecture.',
      '',
      'SDK compatibility matters more than newest version.'
    ),
    new GuideStep(
      2, 0, 'Environment',
      'Install DevEco Studio',
      'Run the IDE installer and finish first-launch setup.',
      'Accept the SDK installation prompts and choose an accessible SDK directory.',
      '',
      'Avoid a folder requiring administrator writes.'
    ),
    new GuideStep(
      3, 0, 'Environment',
      'Select HarmonyOS SDK',
      'Open Settings and locate HarmonyOS SDK settings.',
      'Install toolchains and the matching platform SDK.',
      '',
      'Install components required by your device API.'
    ),
    new GuideStep(
      4, 0, 'Environment',
      'Find HDC',
      'Locate hdc in the SDK toolchains directory.',
      'Open a terminal at that folder or add it to PATH.',
      'hdc -v',
      'If hdc is not found, check the toolchains path.'
    ),
    new GuideStep(
      5, 0, 'Environment',
      'Verify HDC help',
      'Ask HDC for its supported subcommands.',
      'Confirm that the HDC binary executes on your computer.',
      'hdc -h',
      'Use syntax supported by your installed HDC version.'
    ),
    new GuideStep(
      6, 0, 'Environment',
      'Create a wearable project',
      'Create an ArkTS Stage project in DevEco Studio.',
      'Select wearable support and match the watch API level.',
      '',
      'This training app itself is the install target.'
    ),
    new GuideStep(
      7, 0, 'Environment',
      'Inspect bundle name',
      'Open AppScope/app.json5 and inspect bundleName.',
      'Use the same bundle name for your signing profile.',
      '',
      'A mismatch can block installation.'
    ),
    new GuideStep(
      8, 0, 'Environment',
      'Prepare signing',
      'Open File > Project Structure > Signing Configs.',
      'For supported cases, use automatic debug signing.',
      '',
      'Manual signing is available when needed.'
    ),
    new GuideStep(
      9, 0, 'Environment',
      'Manual signing: CSR',
      'Generate .p12 and .csr using DevEco Studio if required.',
      'Keep passwords and keys secure; do not include them in sample projects.',
      '',
      'Skip when automatic signing is successful.'
    ),
    new GuideStep(
      10, 0, 'Environment',
      'Manual signing: certificate',
      'In AppGallery Connect request a debug .cer certificate.',
      'Upload the CSR and download the issued debug certificate.',
      '',
      'Certificate validity and permissions apply.'
    ),
    new GuideStep(
      11, 0, 'Environment',
      'Manual signing: App ID',
      'Create or select an App ID in AppGallery Connect.',
      'Confirm the app package matches your project bundle name.',
      '',
      'Use HarmonyOS application type.'
    ),
    new GuideStep(
      12, 0, 'Environment',
      'Manual signing: device',
      'Register the watch UDID in AppGallery Connect.',
      'Choose Smart watch when the portal requests a device type.',
      'hdc shell bm get -u',
      'Retrieve UDID only after a successful connection.'
    ),
    new GuideStep(
      13, 0, 'Environment',
      'Manual signing: profile',
      'Create a debug profile using the app, certificate, and watch.',
      'Download .p7b and configure .p12, .cer, .p7b in Signing Configs.',
      '',
      'Keep signed files private.'
    ),
    new GuideStep(
      14, 1, 'Developer mode',
      'Open watch Settings',
      'Wake the watch and open Settings.',
      'Find the watch information or About / Software Version page.',
      '',
      'Menus vary by watch firmware.'
    ),
    new GuideStep(
      15, 1, 'Developer mode',
      'Locate Software Version',
      'Navigate to the watch software version entry.',
      'For the supplied sample: Settings > Huawei Watch > Software Version.',
      '',
      'Exact menu labels are device dependent.'
    ),
    new GuideStep(
      16, 1, 'Developer mode',
      'Enable developer options',
      'Tap Software Version repeatedly, typically 5 to 7 times.',
      'Stop after developer mode confirmation is shown.',
      '',
      'Some models require a PIN confirmation.'
    ),
    new GuideStep(
      17, 1, 'Developer mode',
      'Open Developer Options',
      'Return to Settings and locate Developer Options.',
      'Open Settings > System > Developer Options where available.',
      '',
      'If absent, check model / software support.'
    ),
    new GuideStep(
      18, 1, 'Developer mode',
      'Enable HDC debugging',
      'Turn on HDC debugging on the watch.',
      'Approve an authorization dialog if displayed.',
      '',
      'Do not leave debugging enabled unnecessarily.'
    ),
    new GuideStep(
      19, 1, 'Developer mode',
      'Enable Wi-Fi debugging',
      'Turn on Debug via Wi-Fi / Wi-Fi debugging.',
      'Note the IP address and port shown by the watch.',
      '',
      'Example xx.xx.xx.xx:xx is illustrative.'
    ),
    new GuideStep(
      20, 1, 'Developer mode',
      'Check the same network',
      'Connect the computer and watch to the same reachable network.',
      'A PC hotspot is an alternative if supported.',
      '',
      'Guest Wi-Fi may block peer connections.'
    ),
    new GuideStep(
      21, 1, 'Developer mode',
      'Read the endpoint',
      'Read IP and port on the watch Wi-Fi debugging screen.',
      'Keep the debugging page open during initial connection.',
      '',
      'The address can change after reconnecting.'
    ),
    new GuideStep(
      22, 2, 'HDC and HAP',
      'Connect with DevEco',
      'In DevEco Studio open Tools > IP Connection if available.',
      'Enter the watch IP:port and connect.',
      '',
      'Look for Online device state.'
    ),
    new GuideStep(
      23, 2, 'HDC and HAP',
      'Connect with HDC',
      'Alternatively connect from a terminal.',
      'Replace the example endpoint with the watch IP and port.',
      'hdc tconn xx.xx.xx.xx:xx',
      'Never treat the example address as a real device.'
    ),
    new GuideStep(
      24, 2, 'HDC and HAP',
      'List targets',
      'Query the HDC server for connected devices.',
      'Your watch target should appear in the list.',
      'hdc list targets',
      'If empty, verify HDC authorization and routing.'
    ),
    new GuideStep(
      25, 2, 'HDC and HAP',
      'Read watch UDID',
      'Read the unique device identifier from the connected watch.',
      'Use this for manual AGC device registration when required.',
      'hdc shell bm get -u',
      'Do not share UDIDs publicly.'
    ),
    new GuideStep(
      26, 2, 'HDC and HAP',
      'Build Debug HAP',
      'In DevEco Studio, build the entry HAP with debug signing.',
      'Locate the resulting signed .hap in the build output.',
      '',
      'Build locations vary by IDE release.'
    ),
    new GuideStep(
      27, 2, 'HDC and HAP',
      'Install with HDC',
      'Use the HDC install command supported by your version.',
      'Replace the file path with your signed HAP location.',
      'hdc install path/to/entry-default-signed.hap',
      'Check hdc -h if command syntax differs.'
    ),
    new GuideStep(
      28, 2, 'HDC and HAP',
      'Alternate install syntax',
      'Some SDK toolchains expose the app install subcommand.',
      'If direct install is rejected, inspect the HDC help output.',
      'hdc app install path/to/entry-default-signed.hap',
      'Use the syntax printed by your installed tool.'
    ),
    new GuideStep(
      29, 2, 'HDC and HAP',
      'Confirm on watch',
      'Check the watch app launcher for the installed application.',
      'Open the app and verify that its screens fit the display.',
      '',
      'Installation may succeed before launch is verified.'
    ),
    new GuideStep(
      30, 2, 'HDC and HAP',
      'Run from DevEco',
      'Select your connected watch in the device selector.',
      'Choose entry and press Run to build, install and launch.',
      '',
      'Run requires correct debug signing.'
    ),
    new GuideStep(
      31, 2, 'HDC and HAP',
      'Debug the app',
      'Use Debug in DevEco Studio on a connected watch.',
      'Set a breakpoint in the ViewModel and interact with the app.',
      '',
      'The watch app does not execute HDC commands.'
    ),
    new GuideStep(
      32, 2, 'HDC and HAP',
      'Inspect logs',
      'Open HiLog in DevEco Studio or use HDC.',
      'Filter by the project tag to inspect app lifecycle logs.',
      'hdc hilog',
      'Your SDK may provide filtering options.'
    ),
    new GuideStep(
      33, 2, 'HDC and HAP',
      'Resolve no device',
      'Confirm the watch and PC are reachable and authorized.',
      'Toggle debugging off/on, then retry the connection.',
      'hdc list targets',
      'Avoid changing network settings mid-session.'
    ),
    new GuideStep(
      34, 2, 'HDC and HAP',
      'Resolve install failure',
      'Verify a signed debug HAP and compatible target API.',
      'Check the signing bundle name and manual profile device list.',
      '',
      'Read the exact installation error.'
    ),
    new GuideStep(
      35, 2, 'HDC and HAP',
      'End the session',
      'Disconnect the watch when testing is complete.',
      'Disable wireless debugging and HDC debugging.',
      '',
      'Use debug features only on trusted networks.'
    )
  ];

  getChapters(): ChapterInfo[] {
    return this.chapters;
  }

  getStepCount(): number {
    return this.steps.length;
  }

  getStep(id: number): GuideStep {
    let index = Math.max(0, Math.min(id, this.steps.length - 1));
    return this.steps[index];
  }

  getChapter(id: number): ChapterInfo {
    let index = Math.max(0, Math.min(id, this.chapters.length - 1));
    return this.chapters[index];
  }

  getStepsInChapter(id: number): GuideStep[] {
    let result: GuideStep[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].chapter === id) {
        result.push(this.steps[i]);
      }
    }
    return result;
  }

  findByTitle(searchText: string): GuideStep[] {
    let results: GuideStep[] = [];
    let normalized = searchText.toLowerCase();
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].title.toLowerCase().includes(normalized)) {
        results.push(this.steps[i]);
      }
    }
    return results;
  }
}