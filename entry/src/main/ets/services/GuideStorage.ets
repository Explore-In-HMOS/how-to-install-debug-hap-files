export class GuideStorage {
  private checks: boolean[] = [];

  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.checks.push(false);
    }
  }

  read(): boolean[] {
    return this.checks.slice();
  }

  write(index: number, value: boolean): void {
    if (index < 0 || index >= this.checks.length) {
      return;
    }
    this.checks[index] = value;
  }

  reset(): void {
    for (let i = 0; i < this.checks.length; i++) {
      this.checks[i] = false;
    }
  }

  count(): number {
    let result = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i]) {
        result++;
      }
    }
    return result;
  }

  isChecked(index: number): boolean {
    if (index < 0 || index >= this.checks.length) {
      return false;
    }
    return this.checks[index];
  }
}
