
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_incr_enc is
--  Port ( );
end tb_incr_enc;

architecture Behavioral of tb_incr_enc is

component incr_enc 
    Generic( N : integer := 16);
    Port ( clk : in std_logic;
            rst : in std_logic;
            A : in std_logic;
            B : in std_logic;
            Z : in std_logic;
            y : out std_logic_vector(N-1 downto 0));
end component;

signal clk100M : std_logic;
signal rst : std_logic:='0';
signal A : std_logic:='0';
signal B : std_logic:='0';
signal Z : std_logic:='0';
signal Y : std_logic_vector(15 downto 0);
constant clk_period : time := 10ns;

begin
    uut:incr_enc port map(clk=>clk100M, rst=>rst, A=>A, B=>B, Z=>Z, Y=>Y);
        
    clock:process
    begin
        clk100M <= '0';
        wait for clk_period/2;
        clk100M <= '1';
        wait for clk_period/2;
    end process;

    stim:process
    begin
        rst <= '1';
        wait for 20ns;
        rst <= '0';
        wait for 20ns;
        
        -- A first
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        wait for 50ns;
        
        -- B first
        B <= '1';
        wait for 50ns;
        A <= '1';
        wait for 50ns;
        
        B <= '0';
        wait for 50ns;
        A <= '0';
        wait for 50ns;
        
        B <= '1';
        wait for 50ns;
        A <= '1';
        wait for 50ns;
        
        B <= '0';
        wait for 50ns;
        A <= '0';
        wait for 50ns;
        
        B <= '1';
        wait for 50ns;
        A <= '1';
        wait for 50ns;
        
        B <= '0';
        wait for 50ns;
        A <= '0';
        wait for 50ns;
        
        -- Z TEST
        Z <= '1';
        wait for 50ns;
        Z <= '0';
        wait for 50ns;
        
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        
        A <= '1';
        wait for 50ns;
        B <= '1';
        wait for 50ns;
        
        A <= '0';
        wait for 50ns;
        B <= '0';
        wait for 50ns;
        
        wait;
    end process;
end Behavioral;
