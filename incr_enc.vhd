
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity incr_enc is
    Generic( N : integer := 16);
    Port ( clk : in std_logic;
            rst : in std_logic;
            A : in std_logic;
            B : in std_logic;
            Z : in std_logic;
            y : out std_logic_vector(N-1 downto 0));
end incr_enc;

architecture Behavioral of incr_enc is
signal ab, ab_n : std_logic_vector(1 downto 0);
signal a_n, b_n : std_logic;
signal yy, y_n : unsigned(N-1 downto 0);
begin
    
    update_state_machine:process(clk, rst)
    begin
        if rst='1' then
            a_n <= '0';
            b_n <= '0';
            ab <= "00";
            yy <= (others => '0');
        elsif rising_edge(clk) then
            a_n <= A;
            b_n <= B;
            ab <= ab_n;
            yy <= y_n;
        end if;
    end process;
    
    state_machine:process(ab, a_n, b_n)
    begin
        ab_n <= ab;  -- initialize
        y_n <= yy;
        
        case ab is
        when "00" =>
            if a_n='1' then
                y_n <= y_n + 1;
                ab_n <= "10";
            elsif b_n='1' then
                y_n <= y_n - 1;
                ab_n <= "01";
            end if;
        when "01" =>
            if a_n='1' then
                y_n <= y_n - 1;
                ab_n <= "11";
            elsif b_n='0' then
                y_n <= y_n + 1;
                ab_n <= "00";
            end if;
        when "11" =>
            if a_n='0' then
                y_n <= y_n + 1;
                ab_n <= "01";
            elsif b_n='0' then
                y_n <= y_n - 1;
                ab_n <= "10";
            end if;
        when "10" =>
            if a_n='0' then
                y_n <= y_n - 1;
                ab_n <= "00";
            elsif b_n='1' then
                y_n <= y_n + 1;
                ab_n <= "11";
            end if;
         when others =>
            y_n <= yy;
        end case;
        
        if Z='1' then 
            y_n <= (others=>'0');
        end if;
        
    end process;

    Y <= std_logic_vector(yy);

end Behavioral;
