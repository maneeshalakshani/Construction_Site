import React from 'react';

import axios from 'axios';

import '../CSS/view_all_suppliers_css.css';

function ViewSuppliers() {

    const [supplier, setSupplier] = React.useState(null);

    const [supplierID, setSupplierID] = React.useState(null);
    const [businessName, setBusinessName] = React.useState(null);
    const [fullName, setFullName] = React.useState(null);
    const [tele, setTele] = React.useState(null);
    const [email, setEmail] = React.useState(null);
    const [address, setAddress] = React.useState(null);

    React.useEffect(() => {
        axios.get('http://localhost:8002/supplier/getAll').then((response) => {
            setSupplier(response.data.Result);
            console.log(response.data.Result);
        });
      }, []);

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

    if(supplier == null){
        <div className='row'>
            <div className='col container view_all_suppliers_container'>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Supplier ID</th>
                            <th scope="col">Bussiness Name</th>
                            <th scope="col">Supplier Name</th>
                            <th scope="col">Telephone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        No Data
                    </tbody>
                </table>
            </div>
            <div className='col'></div>
        </div>
    }else{
        return(
            <div className='row'>
                <div className='col view_all_suppliers_container'>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Supplier ID</th>
                                <th scope="col">Bussiness Name</th>
                                <th scope="col">Supplier Name</th>
                                <th scope="col">Telephone</th>
                                <th scope="col">Email</th>
                                <th scope="col">Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                supplier.map((su, index) => {
                                    console.log('Inside map')
                                    return(
                                        <tr>
                                            <th scope="row">{su.supplierID}</th>
                                            <td>{su.businessName}</td>
                                            <td>{su.fullName}</td>
                                            <td>{su.tele}</td>
                                            <td>{su.email}</td>
                                            <td>{su.address}</td>
                                        </tr>
                                    )
                                  })
                            }
                        </tbody>
                    </table>
                </div>
                <div className='col'></div>
            </div>
        )
    }
    // return(
    //     <div className='row'>
    //         <div className='col container view_all_suppliers_container'>
    //             <table class="table">
    //                 <thead class="thead-dark">
    //                     <tr>
    //                         <th scope="col">Supplier ID</th>
    //                         <th scope="col">Bussiness Name</th>
    //                         <th scope="col">Supplier Name</th>
    //                         <th scope="col">Telephone</th>
    //                         <th scope="col">Email</th>
    //                         <th scope="col">Address</th>
    //                     </tr>
    //                 </thead>
    //                 <tbody>
    //                     {
    //                         console.log(supplier)
    //                         //displayAllSuppliers(supplier)
    //                     }
    //                     {/* <tr>
    //                         <th scope="row">3</th>
    //                         <td>Larry</td>
    //                         <td>the Bird</td>
    //                         <td>@twitter</td>
    //                         <td>the Bird</td>
    //                         <td>@twitter</td>
    //                     </tr>
    //                     <tr>
    //                         <th scope="row">3</th>
    //                         <td>Larry</td>
    //                         <td>the Bird</td>
    //                         <td>@twitter</td>
    //                         <td>the Bird</td>
    //                         <td>@twitter</td>
    //                     </tr> */}
    //                 </tbody>
    //             </table>
    //         </div>
    //         <div className='col'></div>
    //     </div>
    // )
}

export default ViewSuppliers;