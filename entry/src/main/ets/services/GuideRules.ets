import { GuideStep } from '../model/GuideModels';

export class GuideRules {
  static isValidChapter(id: number): boolean {
    return id >= 0 && id <= 2;
  }

  static percentage(done: number, total: number): number {
    if (total <= 0) {
      return 0;
    }
    return Math.floor((done * 100) / total);
  }

  static chapterPercent(
    marked: boolean[],
    start: number,
    end: number
  ): number {
    let done: number = 0;

    for (let i: number = start; i <= end; i++) {
      if (marked[i] === true) {
        done++;
      }
    }

    return GuideRules.percentage(
      done,
      end - start + 1
    );
  }

  static commandHint(step: GuideStep): string {
    if (!step.hasCommand()) {
      return 'No terminal command in this step.';
    }
    if (step.command.includes('xx.xx.xx.xx:xx')) {
      return 'Replace the example IP:port with your watch endpoint.';
    }
    if (step.command.includes('path/to/')) {
      return 'Replace the example path with your signed HAP path.';
    }
    return 'Run this command on the development computer.';
  }

  static chapterLabel(chapterId: number): string {
    if (chapterId === 0) {
      return 'SETUP';
    }
    if (chapterId === 1) {
      return 'WATCH';
    }
    return 'HDC / HAP';
  }

  static stepNumber(index: number, total: number): string {
    return `${index + 1} / ${total}`;
  }

  static nextButtonLabel(index: number, total: number): string {
    if (index >= total - 1) {
      return 'Finish';
    }
    return 'Next';
  }

  static canGoBack(index: number): boolean {
    return index > 0;
  }

  static canGoNext(index: number, total: number): boolean {
    return index < total - 1;
  }

  static formatCompletion(completed: number, total: number): string {
    return `${completed} of ${total} checked`;
  }
}