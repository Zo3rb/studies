import "./App.css";

const operations = {
  // Define the Calculation Operations.
  "+": (left: number, right: number): number => left + right,
  "-": (left: number, right: number): number => left - right,
  "*": (left: number, right: number): number => left * right,
  "/": (left: number, right: number): number => left / right,
  "**": (left: number, right: number): number => left / right,
  "%": (left: number, right: number): number => left / right,
};
/**
 * Could be done as
 * 1 - declare function type
 * type OperationFn = (left: number, right: number) => number
 * 2 - then using "satisfy" and "Record" Keyword
 * satisfy Record<string, OperationFn> after the type for deriving.
 */

type CalculatorProps = {
  // Making all Optional for Deriving.
  operation?: string;
  left?: number;
  operator?: keyof typeof operations;
  right?: number;
};

function Calculator({
  operation = "Default Operation",
  left = 1,
  operator = "*",
  right = 1,
}: CalculatorProps) {
  // Making Default Props.
  const result = operations[operator](left, right);
  return (
    <div>
      <code style={{ fontSize: "32px" }}>
        {operation}: {left} {operator} {right} = <output>{result}</output>
      </code>
    </div>
  );
}

function App() {
  return (
    <>
      <h1>Hello, From React 19 + TypeScript Playground.</h1>
      <br />
      <h2>
        Simple Static Calculations to Demonstrate TypeScript with Calculator
        Application
      </h2>
      <Calculator operation="Addition" left={5} operator="+" right={10} />
      <Calculator operation="Multiplication" left={5} operator="*" right={10} />
      <Calculator operation="Subtraction" left={5} operator="-" right={10} />
      <Calculator operation="Division" left={5} operator="/" right={10} />
      <Calculator />
    </>
  );
}

export default App;
