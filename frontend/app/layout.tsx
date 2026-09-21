import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Carpool — Share the route. Split the cost.",
  description: "Match with Michigan riders and drivers already traveling along the same route.",
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
