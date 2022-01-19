import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-watch-to-ios' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const WatchToIos = NativeModules.WatchToIos
  ? NativeModules.WatchToIos
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return WatchToIos.multiply(a, b);
}
