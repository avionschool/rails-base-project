import React, {useState, useEffect} from 'react';
import { BsSearch } from "react-icons/bs";

function CoingeckoList({coinsList}) {
  const [items, setItems] =useState([...coinsList]);
  const [searchInput, setSearchInput] = useState("");

  useEffect(() => {
    let input = searchInput.toLowerCase();
    const result = coinsList
      .filter(function(coin){
        // separate these so you can add to it later on i guess?
        let cgId = coin.id.toLowerCase().indexOf(input) !== -1;
        let base = coin.symbol.toLowerCase().indexOf(input) !== -1;
        let name = coin.name.toLowerCase().indexOf(input) !== -1;
        return cgId || base || name;
      });
    setItems(result);
  }, [searchInput]);

  const list = items.slice(0,30).map((coin) => {
    return(
      <>
        <div className="coinslist-item">
          <p> {coin.symbol.toUpperCase()} </p>
          <p> {coin.name} </p>
          <p> {coin.id} </p>
        </div>
      </>
    )
  });

  return (
    <>
      <div className="coinslist-searchbar">
        <BsSearch />
        <input className="coinslist-input" placeholder="Search" type="text" value={searchInput} onChange={e => setSearchInput(e.target.value)} />
      </div>
      <div className="coinslist-item header">
        <p> Symbol </p> 
        <p> Name </p>
        <p> Coingecko Id </p>
      </div>
      <div className = "coinslist-items">
        {searchInput ? list : "Waiting for search input..."}
      </div>

    </>
  )
}

export default CoingeckoList
