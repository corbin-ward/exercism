export function decodedValue(colors: string[]): number {
  const firstValue = COLORS.indexOf(colors[0]);
  const secondValue = COLORS.indexOf(colors[1]);

  return (firstValue * 10) + secondValue;
}

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];