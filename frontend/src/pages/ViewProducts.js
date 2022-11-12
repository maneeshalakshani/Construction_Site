import React from "react";
import '../CSS/Viewproduct.css'
import {Link} from "react-router-dom";

const ViewProduct =(props)=>{
    const{_id,name,unitPrice,unitType}=props.Result;
    return(
    <div>
  
    <div className="cardofmenus">
       
        <h1>{name}</h1>
        <article>Rs. {unitPrice}</article>
      
    </div>
    </div>
    )
};

export default ViewProduct;