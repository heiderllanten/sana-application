import Link from 'next/link';
import "./globals.css";

export default function Home() {
  return (
    <Link href="/catalog"><div className="backLink">Go to Catalog</div></Link>
  );
}
