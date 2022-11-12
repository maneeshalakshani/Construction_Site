import React from 'react';
import '../CSS/Addproduct.css'

function Addproduct() {
 
    return(
        <div>
        <br></br>
        <div className='container'>
            <div >
            <br></br><br></br><br></br>
                <div class ="menuforminside col-md-9">
            <form>
            <br></br>
           <br></br>
           <ul className='addproductul'>
           <ul className='addproductul'>
           <div class="row">
                <div class="col-25">
                    <label for="fname">Supplier ID</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your id.."></input>
                </div>
            </div>
            <br></br>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Conatct Full Name</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your full name.."></input>
                </div>
            </div>
           </ul>
           
           </ul>
           <ul className='addproductul'>
           <div class="row">
                <div class="col-25">
                    <label for="fname">Supplier ID</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your id.."></input>
                </div>
            </div>
            <br></br>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Conatct Full Name</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your full name.."></input>
                </div>
            </div>
           </ul>
            <br></br>
           
            <br></br>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Telephone</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your phone number.."></input>
                </div>
            </div>
            <br></br>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Email</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your email.."></input>
                </div>
            </div>
            <br></br>
            <div class="row">
                <div class="col-25">
                    <label for="fname">Address</label>
                </div>
                <div class="col-75">
                    <input type="text" id="fname" name="firstname" placeholder="Your address.."></input>
                </div>
            </div>
            <br></br> <br></br> <br></br> <br></br>
            <div class="row" id="addsupplierbutton">
                <ul className='addsupplierul'>
                <button type="submit" className="savebutton">Save menu</button>
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

export default Addproduct;