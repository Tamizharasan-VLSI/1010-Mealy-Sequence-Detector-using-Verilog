# Overlapping 1010 Mealy FSM in Verilog

This repository contains a **Mealy Finite State Machine (FSM)** implementation in Verilog that detects the **overlapping `1010` bit sequence**. A testbench is included to verify the functionality using both fixed and random input sequences.

---

## FSM Design Details

- **Type:** Mealy FSM  
- **Sequence Detected:** `1010` (overlapping allowed)  
- **State Encoding:**

| State | Binary | Description              |
|-------|--------|--------------------------|
| s0    | 00     | Initial / reset state    |
| s1    | 01     | Received `1`             |
| s2    | 10     | Received `10`            |
| s3    | 11     | Received `101`           |

- **Output:** `data_out` is asserted `1` **based on the current state and input** when full sequence `1010` is detected.  

- **Overlapping FSM Behavior:**  
  After detecting the sequence, the FSM continues from **s2** to allow overlapping detection.  

---

## Testbench Details

- **Clock generation:** 10-time unit period using `always #5 clk = ~clk`.  
- **Reset task:** Asserts `rst` for 10-time units at the beginning of simulation.  
- **Sequence task (`seq`)**: Provides a fixed input sequence `10011010101` to the FSM.  
- **Random input tasks (`random`, `random_`)**:  
  - `random` generates 20 random bits using `$random & 1`.  
  - `random_` generates 30 random bits using `$urandom`.  

- `$monitor` and `$dumpvars` can be added to track `data_in` and `data_out` in waveform or console.  

---

## How to Simulate

1. Open your preferred Verilog simulator (Vivado XSim, ModelSim, etc.).  
2. Compile `Source code.v` and `TB.v`.  
3. Run the simulation.  
4. Observe the output `data_out` in waveform or console.  

---

## Expected Behavior

- `data_out` goes high whenever the **`1010` sequence** is detected in `data_in`.  
- Overlapping sequences are correctly detected, allowing detection of new sequences that share bits with previous sequences.  


## 📁 Repository Contents
| File | Description |
|------|-------------|
| `Design code.v` | RTL Verilog Code |
| `TB.v` | Testbench Code |
| `waveform.png` | waveform dump file |
| `Output` | simulation output |
| `Schematic` | schematic view |

---

## 🛠 Tools Used
- Verilog Simulator (EDA Playground/Xilinx Vivado)

---

## 👩‍💻 Author
**Tamizharasan**  
VLSI Enthusiast | Digital Design Learner  
More designs coming soon… 😊

---
