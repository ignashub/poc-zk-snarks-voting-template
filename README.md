# Zero-Knowledge Proofs template

ZK-Proofs template is an extension of [WEB3 Template](https://github.com/Byont-Ventures/web3-template) which is a boilerplate for developing Dapps. This project is using 2 libraries for its ZK-Proofs:

- [Circom](https://github.com/iden3/circom) - compiler to write circuits (problem statements)
- [SnarkJS](https://github.com/iden3/snarkjs) - JavaScript implementation of zkSNARK schemes

## Getting Started

Before getting started, we suggest reading our [Contributing Guidelines](/CONTRIBUTING.md).

### Prerequisites

Besides, installing tooling from [WEB3 Template](https://github.com/Byont-Ventures/web3-template). You'll need the following tools to run the entire application locally:

- [Circom](https://github.com/iden3/circom)

You need several dependencies in your system to run [circom](https://github.com/iden3/circom) and its associated tools:

### Installing Circom

If you want follow official [Circom](https://docs.circom.io/getting-started/installation/#installing-circom) installation, follow [this](https://docs.circom.io/getting-started/installation/#installing-circom).

To install from sources, clone the [circom](https://github.com/iden3/circom) repository:

```
git clone https://github.com/iden3/circom.git
```

Enter the [circom](https://github.com/iden3/circom) directory and use the cargo build to compile:

```
cargo build --release
```

The installation takes around 3 minutes to be completed. When the command successfully finishes, it generates the [circom](https://github.com/iden3/circom) binary in the directory target/release. You can install this binary as follows:

```
cargo install --path circom
```

### Installing Snarkjs

[SnarkJS](https://github.com/iden3/snarkjs) is a npm package that contains code to generate and validate ZK proofs from the artifacts produced by circom.

You can install [snarkJS](https://github.com/iden3/snarkjs) with the following command:

```
npm install -g snarkjs
```

### Running Scripts

Before running the application it is needed to run [snarkJS](https://github.com/iden3/snarkjs) scripts. These scripts were made to speed up process of generating [circom](https://github.com/iden3/circom) circuits and doing [Trusted setup](https://blog.hermez.io/hermez-zero-knowledge-proofs/) phase.
To know how each circuit is generated, you can see the execute files inside the scripts folder.

To run the scripts go inside the scripts folder:

```
$ cd apps/zkproof/scripts
```

Run this command per script:

```
chmod u+x execute_groth16_circuit_example.sh

chmod u+x execute_plonk_circuit_example.sh

chmod u+x execute_vote_no_circuit.sh

chmod u+x execute_vote_yes_circuit.sh
```

And after that, you can always run this per script:

```
./execute_groth16_circuit_example.sh

./execute_plonk_circuit_example.sh

./execute_vote_no_circuit.sh

./execute_vote_yes_circuit.sh
```

## Circuit Explanation

Several diagrams were drawn to understand and have a better view of how the implemented circuits work.
To get more information on how to write Circom circuits check [this](https://docs.circom.io/)
Let's start with a simple prover and verifier workflow:

![alt text](https://github.com/ignashub/web3-template/blob/main/apps/zkproof/diagrams/prover_verifier_workflow.png?raw=true)

After that, let's look into our simple example circuit:

![alt text](https://github.com/ignashub/web3-template/blob/main/apps/zkproof/diagrams/arithmetic_circuit_example.png?raw=true)

This circuit is very simple and it is easy to reverse engineer the private signal. Nonetheless, it was made for
learning cases:

- Prover enters private signal B.
- Public signals are already given. (In this case you enter them through front-end, but it could be hard-coded).
- Intermediary signal D is calculated.
- signal D is summed up with signal C to get OUT signal which is always 18.

So, in short what this circuit does it takes 2 public and 1 private signal. Then it does the constraints and sees
if it is equal to 18.
What Prover and Verifier sees can be visualized through these diagrams:

![alt text](https://github.com/ignashub/web3-template/blob/main/apps/zkproof/diagrams/prover_verifier_views.png?raw=true)

- Prover knows everything about the circuit. All public, private signals, constraints, output.
- Verifier knows all the public signals, constraints, and the output value.
