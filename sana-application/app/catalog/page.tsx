"use client";

import { useState, useEffect } from 'react'; 
import { Circles } from 'react-loader-spinner'
import Link from 'next/link';
import Image from 'next/image'
import styles from './catalog.module.css';
import {PagedResponseDTO, Product} from '../paged-response-dto';

const Catalog = () => {
  const [cart, setCart] = useState([]);
  const [pagedProducts, setPagedProducts] = useState({} as PagedResponseDTO);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const productsPerPage = 3;

  useEffect(() => {
    fetchProducts();
  }, []);

  useEffect(() => {
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
      setCart(JSON.parse(storedCart));
    }
  }, []);

  useEffect(() => {
    localStorage.setItem('cart', JSON.stringify(cart));
  }, [cart]);

  const fetchProducts = async (pageNumber: number = 1, pageSize: number = 3) => {
    try {
      const response = await fetch(`https://localhost:7192/api/Products/paginatedproducts?pageNumber=${pageNumber}&pageSize=${pageSize}`);
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json() as PagedResponseDTO;
      setPagedProducts(data);
    } catch (error: any) {
      setError(error);
    } finally {
      setLoading(false);
    }
  };

  const handleAddToCart = (product: any, quantity: any) => {
    debugger;
    if (quantity > product.stock) {
      alert('Not enough stock available.');
      return;
    }
    
    const newCart: any = { ...cart };
    if (newCart[product.id]) {
      newCart[product.id].quantity += quantity;
    } else {
      newCart[product.id] = { ...product, quantity };
    }

    setCart(newCart);
    alert("Product was added to shopping cart successfully!");  
  };

  if (loading) {
    return <div className={styles.spinner}>
        <Circles
          height="80"
          width="80"
          color="green"
          ariaLabel="loading"
        />
      </div>
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div className={styles.container}>
      <h1>Catalog</h1>
      <ul className={styles.productList}>
        {pagedProducts.items?.map((product: Product) => (
          <li key={product.id} className={styles.productItem}>
            <div className={styles.productInfo}>
              <Image
                src="/motosierra.jpg"
                width={80}              
                height={80}
                alt="Picture of the author"
              />
              <div>
                <h2><b>{product.name}</b></h2>
                <div>
                  <p>Item No: {product.code}</p> <p>|</p> 
                  <p className={styles.stockLabel}><b>{product.quantity} in stock</b></p>
                </div>
                <p>{product.description}</p>
              </div>
            </div>
            <div>
              <p><b>${product.price}</b></p>
            </div>
            <div>
              <input type="number" id={`quantity-${product.id}`} min="1" max={product.quantity} defaultValue="1" />
              <button className="addButton" onClick={() => handleAddToCart(product, parseInt(document.getElementById(`quantity-${product.id}`)?.value))}>
                Add to Cart
              </button>
            </div>
          </li>
        ))}
      </ul>
      <div className={styles.pagination}>
        {Array(Math.ceil(pagedProducts.totalItems / productsPerPage)).fill(null).map((_, idx) => (
          <button key={idx} onClick={() => fetchProducts(idx + 1, productsPerPage)}>
            {idx + 1}
          </button>
        ))}
      </div>
      <Link href="/shopping-cart"><div className="backLink">Go to Shopping Cart</div></Link>
    </div>
  );
};

export default Catalog;
