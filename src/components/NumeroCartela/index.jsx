import { useState } from 'react';
import * as styles from './styles.module.css'

export const NumeroCartela = (props) => {
  const [sorteado, setSorteado] = useState(false);
  
  return (
    <div className={styles.numeroWrapper}>
      <a onClick={() => setSorteado(!sorteado)} className={styles.numero +` ${sorteado ? styles.active : ''}`}>{props.numero}</a>
    </div>
  )
}