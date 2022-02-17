import * as styles from './styles.module.css';

export const InfoSorteio = (props) => {

  return ( 
    <div className={styles.sorteio+" "+props.className}>
      <h2 className={styles.textoSorteio}>Número sorteado:</h2>
      <div className={styles.numeroWrapper}>
        <span className={styles.numeroSorteado}>23</span>
      </div>
    </div>
  )
}