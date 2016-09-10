# Tutorial-1
<beast version = '2.0' namespace='master:master.model:master.steppers:master.conditions:master.postprocessors:master.outputs'>

<run spec='Ensemble'
       simulationTime='100'
       nTraj='1000'>

  <model spec='Model' id= 'Model'>
    <populationType spec='PopulationType' typeName='S' dim='2' id='S'/>
    <populationType spec='PopulationType' typeName='I' dim='2' id='I'/>

   <reaction spec='Reaction' rate= "0.01">
     I[i] + S[j] -> I[i] + I[j]
   </reaction>

   <reaction spec='Reaction' rate= "0.01">
     I[j] + S[i] -> I[j] + I[i]
   </reaction>
</model>

<initialState spec='InitState'>
  <populationSize spec='PopulationSize' size='1'>
    <population spec='Population' type='@I' location="0"/>
  </populationSize>
  <populationSize spec='PopulationSize' size='100'>
    <population spec='Population' type='@S' location="0"/>
  </populationSize>
  <populationSize spec='PopulationSize' size='100'>
    <population spec='Population' type='@S' location="1"/>
  </populationSize>
</initialState>

  <populationEndCondition spec='PopulationEndCondition'
                threshold="0"
                exceedCondition="False"
                isRejection="True">
   <population spec='Population' type='@I' location='0'/>
   <population spec='Population' type='@I' location='1'/>
 </populationEndCondition>
   <output spec='JsonOutput' fileName='nz.json'/>
 </run>
</beast>
