# A Language-Agnostic Hierarchical LoRA-MoE Architecture for CTC-based Multilingual ASR


# Data
for each dataset, we provide utt_id

data/msr_86k/. 1500 hours

data/mlc_slm/english_indian 100 hours

data/mlc_slm/french 100 hours

data/mlc_slm/german 100 hours

data/mlc_slm/japanese 100 hours

data/mlc_slm/korean 100 hours

# Result

<b>Table: Overall mASR results on the MLC-SLM 2025 datasets.</b><br>
MSR-1500h and MLC-500h denote training data subsets selected from MSR-86K and MLC-SLM 2025, respectively.<br>
“√” and “×” indicate language-known and language-agnostic inference, while “single” and “double” denote single-pass and two-stage inference, respectively.<br>
For S1–S6, all systems share the same mHuBERT-147 backbone pretrained on 90k hours of multilingual data.
<br><br>

<table>
  <tr>
    <th rowspan="2">ID</th>
    <th rowspan="2">System</th>
    <th rowspan="2">Params (M)</th>
    <th rowspan="2">Training Data</th>
    <th rowspan="2">LID</th>
    <th rowspan="2">Inference</th>
    <th colspan="2">Evaluation Sets (WER %)</th>
  </tr>
  <tr>
    <th>MLC-dev</th>
    <th>MLC-test</th>
  </tr>

  <tr>
    <td>S1</td>
    <td rowspan="2">mHuBERT-CTC (baseline)</td>
    <td rowspan="2">97</td>
    <td>MSR-1500h</td>
    <td>×</td>
    <td>single</td>
    <td>44.5</td>
    <td>43.7</td>
  </tr>
  <tr>
    <td>S2</td>
    <td>MLC-500h</td>
    <td>×</td>
    <td>single</td>
    <td>22.5</td>
    <td>21.6</td>
  </tr>

  <tr>
    <td>S3</td>
    <td rowspan="2">mHuBERT-CTC-LIDLoRA</td>
    <td rowspan="2">107</td>
    <td rowspan="2">MLC-500h</td>
    <td>√</td>
    <td>single</td>
    <td>24.6</td>
    <td>23.0</td>
  </tr>
  <tr>
    <td>S4</td>
    <td>×</td>
    <td>double</td>
    <td><b>26.6</b></td>
    <td><b>24.8</b></td>
  </tr>

  <tr>
    <td>S5</td>
    <td rowspan="2">mHuBERT-CTC-HLoRA</td>
    <td rowspan="2">102</td>
    <td rowspan="2">MLC-500h</td>
    <td>√</td>
    <td>single</td>
    <td>26.0</td>
    <td>24.0</td>
  </tr>
  <tr>
    <td>S6</td>
    <td>×</td>
    <td>single</td>
    <td><b>26.3</b></td>
    <td><b>24.7</b></td>
  </tr>

  <tr>
    <td>S7</td>
    <td>Whisper-base</td>
    <td>74</td>
    <td>680,000h</td>
    <td>×</td>
    <td>single</td>
    <td>37.2</td>
    <td>35.4</td>
  </tr>

  <tr>
    <td>S8</td>
    <td>Whisper-small</td>
    <td>244</td>
    <td>680,000h</td>
    <td>×</td>
    <td>single</td>
    <td>29.7</td>
    <td>28.6</td>
  </tr>
</table>
