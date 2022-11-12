import React from 'react';
import '../CSS/Addproduct.css'
import {Link} from 'react-router-dom';

function Addproduct() {
 
    return(
        <div className='container row'>
        <br></br>
        <div>
        <Link to='/viewproduct'>
            <button className='btn btn-secondary'>
                View All Suppliers
            </button>
        </Link>
            <button></button>
            <div >
            <br></br>
        <div>
            <form>
            <br></br>
           <br></br>
           <ul className='addproductul'>
           <div class="row">
                <div class="row">
                    <label for="fname">Product ID</label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="firstname" size="23" placeholder="Product id.."></input>
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="row">
                <div class="row">
                    <label for="fname">Product Name</label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="productname" size="23" placeholder="Product name.."></input>
                </div>
            </div>
           </ul>
           <br></br> <br></br> <br></br>   <br></br> <br></br> 
           <ul className='addproductul'>
           <div class="row">
                <div class="row">
                    <label for="fname">Supplier       </label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="suppliername" size="25" placeholder="Supplier name.."></input>
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="row">
                <div class="row">
                    <label for="fname">Price Range   </label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="pricerange" size="25" placeholder="Price range.."></input>
                </div>
            </div>
           </ul>
           <br></br> <br></br> <br></br><br></br> <br></br>
           <ul className='addproductul'>
           <div class="row">
                <div class="row">
                    <label for="fname">Quantity Type</label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="quantitytype" size="20" placeholder="Quantity Type.."></input>
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="row">
                <div class="row">
                    <label for="fname">Quantity     </label>
                </div>
                <div class="row">
                    <input type="text" id="fname" name="quantity" size="26" placeholder="Quantity      "></input>
                </div>
            </div>
           </ul>
            <br></br><br></br><br></br><br></br><br></br>
            <div class="row">
                <div class="row">
                    <label for="fname">Discription</label>
                </div>
                <div class="row">
                    <textarea type="text" id="fname" name="discription" size="20" placeholder="discription.."></textarea>
                </div>
            </div>
            <br></br> <br></br> <br></br> <br></br>
            <div class="row" id="addsupplierbutton">
                <ul className='addsupplierul'>
                <button type="submit" className="addproductbutton">Save Product</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="submit" className="cancelproductbutton">Cancel</button>
                </ul>
        
            </div>
            <br></br>
            </form>
            </div>
            <br></br><br></br><br></br>
            </div>
        </div>
        </div>
    
          
            )
}

export default Addproduct;