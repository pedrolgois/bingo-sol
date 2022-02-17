import { useState } from 'react';
import './App.css';
import { Cartela } from './components/Cartela';
import { InfoSorteio } from './components/InfoSorteio';

export const App = () => {
  const [numeros, setNumeros] = useState([]);
  return (
    <main>
      <h1>BINGO APP</h1>
      <section className="bingo-funcs">
        <button className='btn' onClick={() => atualizaInterface()} >BINGO!</button>
        <button className='btn' onClick={() => comprarCartela(setNumeros)}>Comprar cartela</button>
        <button className='btn' onClick={() => sortearNumeros()}>Sortear numero</button>
      </section>
      <p id='total-rifas'></p>
      <section className="content">
        <Cartela className="cartela" numeros={numeros}/>
        <InfoSorteio className="sorteio"/>
      </section>
    </main>
  )
}
