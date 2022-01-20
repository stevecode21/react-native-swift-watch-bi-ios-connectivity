import * as React from 'react';

import { StyleSheet, View, TouchableOpacity, Text } from 'react-native';
import { sendMessage } from 'react-native-watch-to-ios';

export default function App() {
  // const [result, setResult] = React.useState<number | undefined>();

  function handleSend() {
    console.log('PRESSED');
    sendMessage({ message: 'Hola mundo!!' });
  }
  return (
    <View style={styles.container}>
      <TouchableOpacity onPress={handleSend}>
        <Text>Press me</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
