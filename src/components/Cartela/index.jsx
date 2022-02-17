import { useState } from "react";
import { NumeroCartela } from "../NumeroCartela";
import * as styles from "./styles.module.css";

export const Cartela = (props) => {
  const numeros = props.numeros;
  console.log('array:',numeros);
  function Render(){
    
    if(numeros.length > 0){
        return numeros.map(numero =>{
          return(
            <>
            <NumeroCartela numero={numero}/>
            </>
          );
        })
      }
      else{
        <>
        <p>Teste</p>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
          <NumeroCartela numero={0}/>
        </>
      }
  }
  
  return (
    <div className={styles.cartela +" "+ props.className}>
      {Render()}
    </div>
  )
}