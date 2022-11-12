import React from 'react';

import axios from 'axios';

import '../CSS/Addsupplier.css'
import { Link } from 'react-router-dom';

function AddSupplier() {

    const [supplier, setSupplier] = React.useState(null);

    const [supplierID, setSupplierID] = React.useState(null);
    const [businessName, setBusinessName] = React.useState(null);
    const [fullName, setFullName] = React.useState(null);
    const [tele, setTele] = React.useState(null);
    const [email, setEmail] = React.useState(null);
    const [address, setAddress] = React.useState(null);

  function addSupplier() {
    axios
      .post('http://localhost:8002/supplier/add', {
        supplierID: supplierID,
        businessName: businessName,
        fullName: fullName,
        tele: tele,
        email: email,
        address: address,
      })
      .then((response) => {
        setSupplier(response.data);
      });
  }
 
    return(
        <div>
        <br></br> 
            <div className='container row'>
                <div >
                    <br></br><br></br><br></br>
                    <div class ="menuforminside col-md-9">       
                        <form>
                            <div>
                                <Link to='/viewsuppliers'>
                                    <button className='btn btn-secondary'>
                                        View All Suppliers
                                    </button>
                                </Link>
                            </div>
                            <br></br><br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Supplier Business Name</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your company.." onChange={e => {setBusinessName(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Supplier ID</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your id.." onChange={e => {setSupplierID(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Conatct Full Name</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your full name.." onChange={e => {setFullName(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Telephone</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your phone number.." onChange={e => {setTele(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Email</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your email.." onChange={e => {setEmail(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br>
                            <div class="row">
                                <div class="col-25">
                                    <label for="fname">Address</label>
                                </div>
                                <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your address.." onChange={e => {setAddress(e.target.value);}}></input>
                                </div>
                            </div>
                            <br></br> <br></br> <br></br> <br></br>
                            <div class="row" id="addsupplierbutton">
                                <ul className='addsupplierul'>
                                <button type="submit" className="savebutton" onClick={addSupplier}>Save Supplier</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" className="cancelbutton">Cancel</button>
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

export default AddSupplier;