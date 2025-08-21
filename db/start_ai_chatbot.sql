-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2025 at 06:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `start_ai_chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_chat_history`
--

CREATE TABLE `ai_chat_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`details`)),
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ai_chat_history`
--

INSERT INTO `ai_chat_history` (`id`, `user_id`, `session_id`, `details`, `created`, `last_updated`) VALUES
(16, 1, 'session_0', '{\"messages\": [{\"role\": \"system\", \"content\": \"You are chatting with a startup named Tech Builder. Description: AI chatbot developer. Type: AI, Stage: Seed.\"}, {\"role\": \"user\", \"content\": \"hello\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I help you today?\"}, {\"role\": \"user\", \"content\": \"how to get funding\"}, {\"role\": \"assistant\", \"content\": \"To get funding for your AI chatbot development startup, here are a few steps you can consider:\\n\\n1. **Define Your Business Plan**: Clearly outline your business model, target market, competition, and revenue streams.\\n\\n2. **Build a Prototype**: Develop a working prototype or MVP (Minimum Viable Product) to demonstrate your AI chatbot capabilities.\\n\\n3. **Market Research**: Conduct thorough market research to validate the need for your AI chatbot solution and understand your target customers.\\n\\n4. **Create a Pitch Deck**: Prepare a compelling pitch deck that highlights your team, product, market opportunity, and financial projections.\\n\\n5. **Seek Seed Funding**: Look for seed funding from angel investors, venture capital firms, or startup accelerators that specialize in AI and chatbot technologies.\\n\\n6. **Networking**: Attend industry events, conferences, and startup meetups to network with potential investors and industry experts.\\n\\n7. **Crowdfunding**: Consider using crowdfunding platforms like Kickstarter or Indiegogo to raise funds from the public.\\n\\n8. **Government Grants and Programs**: Explore government grants and programs that support AI startups and innovative technologies.\\n\\nRemember to tailor your funding strategy to your specific needs and industry landscape. Good luck with securing funding for your AI chatbot development startup!\"}, {\"role\": \"user\", \"content\": \"hi\"}, {\"role\": \"assistant\", \"content\": \"Hello again! How can I assist you today?\"}, {\"role\": \"user\", \"content\": \"hello\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I help you today?\"}, {\"role\": \"user\", \"content\": \"hi\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I assist you today?\"}]}', '2025-08-20 04:55:30', '2025-08-20 06:54:01'),
(17, 1, 'session_1', '{\"messages\": [{\"role\": \"system\", \"content\": \"You are chatting with a startup named Tech Builder. Description: AI chatbot developer. Type: AI, Stage: Seed.\"}, {\"role\": \"user\", \"content\": \"hello\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I assist you today?\"}]}', '2025-08-20 06:29:37', '2025-08-20 06:29:39'),
(18, 1, 'session_2', '{\"messages\": [{\"role\": \"system\", \"content\": \"You are chatting with a startup named Tech Builder. Description: AI chatbot developer. Type: AI, Stage: Seed.\"}, {\"role\": \"user\", \"content\": \"hi\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I assist you today?\"}]}', '2025-08-20 06:38:13', '2025-08-20 06:38:15'),
(19, 1, 'session_4', '{\"messages\": [{\"role\": \"system\", \"content\": \"You are chatting with a startup named Tech Builder. Description: AI chatbot developer. Type: AI, Stage: Seed.\"}, {\"role\": \"user\", \"content\": \"hi\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I assist you today?\"}]}', '2025-08-20 07:18:08', '2025-08-20 07:18:10'),
(20, 1, 'session_5', '{\"messages\": [{\"role\": \"system\", \"content\": \"You are chatting with a startup named Tech Builder.\\nStartup Name: Tech Builder AI Pvt Ltd\\nDescription: AI chatbot developer\\nIndustry: AI.\"}, {\"role\": \"user\", \"content\": \"hello\"}, {\"role\": \"assistant\", \"content\": \"Hello! How can I assist you today?\"}]}', '2025-08-20 08:16:19', '2025-08-20 08:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `ai_faqs_a`
--

CREATE TABLE `ai_faqs_a` (
  `id` int(11) NOT NULL,
  `Q_id` int(11) NOT NULL,
  `faq_A` text NOT NULL,
  `type` enum('Startup','Mentor','Investor') NOT NULL,
  `removed` enum('y','n') NOT NULL DEFAULT 'n',
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ai_faqs_a`
--

INSERT INTO `ai_faqs_a` (`id`, `Q_id`, `faq_A`, `type`, `removed`, `created`) VALUES
(1, 1, 'Product-market fit means your product satisfies strong market demand.', 'Startup', 'n', '2025-08-19 07:28:41'),
(2, 2, 'You can raise seed funding by approaching angel investors and using a solid pitch deck.', 'Startup', 'n', '2025-08-19 07:28:41'),
(3, 3, 'An MVP is the simplest version of your product that allows you to test assumptions with real users.', 'Startup', 'n', '2025-08-19 07:28:41'),
(4, 4, 'Conduct customer interviews, surveys, and build prototypes to test assumptions.', 'Startup', 'n', '2025-08-19 07:28:41'),
(5, 5, 'Pick someone with complementary skills, shared vision, and mutual trust.', 'Startup', 'n', '2025-08-19 07:28:41'),
(6, 6, 'Building without validation, ignoring feedback, poor financial planning, and scaling too early.', 'Startup', 'n', '2025-08-19 07:28:41'),
(7, 7, 'Focus on customer acquisition through marketing, partnerships, and strong value delivery.', 'Startup', 'n', '2025-08-19 07:28:41'),
(8, 8, 'Register your business, choose a legal structure, and ensure compliance with tax and labor laws.', 'Startup', 'n', '2025-08-19 07:28:41'),
(9, 9, 'Use NDAs, file patents, and focus on execution rather than secrecy.', 'Startup', 'n', '2025-08-19 07:28:41'),
(10, 10, 'A pitch deck is a brief presentation that outlines your business idea, model, traction, and funding needs.', 'Startup', 'n', '2025-08-19 07:28:41'),
(11, 11, 'Monitor expenses closely, maintain a buffer, and optimize operations.', 'Startup', 'n', '2025-08-19 07:28:41'),
(12, 12, 'Bootstrapping means starting a business using personal savings or revenue instead of outside funding.', 'Startup', 'n', '2025-08-19 07:28:41'),
(13, 13, 'You should pivot when the current model doesn’t show traction despite repeated efforts.', 'Startup', 'n', '2025-08-19 07:28:41'),
(14, 14, 'Focus on versatile people who share your vision and are motivated by growth.', 'Startup', 'n', '2025-08-19 07:28:41'),
(15, 15, 'A capitalization table shows ownership stakes, equity dilution, and value of shares.', 'Startup', 'n', '2025-08-19 07:28:41'),
(16, 16, 'Programs that support startups with mentorship, funding, and networking.', 'Startup', 'n', '2025-08-19 07:28:41'),
(17, 17, 'Research the investor, refine your pitch, and highlight traction and market size.', 'Startup', 'n', '2025-08-19 07:28:41'),
(18, 18, 'Customer churn is the percentage of customers who stop using your product or service.', 'Startup', 'n', '2025-08-19 07:28:41'),
(19, 19, 'By improving customer support, product quality, and engagement.', 'Startup', 'n', '2025-08-19 07:28:41'),
(20, 20, 'Through revenue growth, user adoption, retention, and market share.', 'Startup', 'n', '2025-08-19 07:28:41'),
(21, 21, 'Metrics like CAC, LTV, churn rate, and MRR are commonly evaluated.', 'Investor', 'n', '2025-08-19 07:28:41'),
(22, 22, 'Look at team strength, market size, traction, and unique value proposition.', 'Investor', 'n', '2025-08-19 07:28:41'),
(23, 23, 'Due diligence is a detailed investigation of a startup\'s finances, legal status, and operations before investing.', 'Investor', 'n', '2025-08-19 07:28:41'),
(24, 24, 'Angel investors, venture capitalists, private equity firms, and crowdfunding participants.', 'Investor', 'n', '2025-08-19 07:28:41'),
(25, 25, 'An exit strategy is a plan for investors to realize returns, such as IPOs or acquisitions.', 'Investor', 'n', '2025-08-19 07:28:41'),
(26, 26, 'By diversifying portfolios, setting clear terms, and conducting due diligence.', 'Investor', 'n', '2025-08-19 07:28:41'),
(27, 27, 'SAFE (Simple Agreement for Future Equity) lets startups raise funds without immediate valuation.', 'Investor', 'n', '2025-08-19 07:28:41'),
(28, 28, 'Lack of traction, high burn rate, no clear business model, and weak leadership.', 'Investor', 'n', '2025-08-19 07:28:41'),
(29, 29, 'A large and growing market increases chances of scaling and higher returns.', 'Investor', 'n', '2025-08-19 07:28:41'),
(30, 30, 'Valuation determines the worth of a startup based on growth potential and assets.', 'Investor', 'n', '2025-08-19 07:28:41'),
(31, 31, 'Pre-money is the valuation before investment; post-money includes the investment amount.', 'Investor', 'n', '2025-08-19 07:28:41'),
(32, 32, 'Balance risk and reward by aligning valuation, growth prospects, and expected returns.', 'Investor', 'n', '2025-08-19 07:28:41'),
(33, 33, 'A convertible note is a short-term debt that converts into equity at a future funding round.', 'Investor', 'n', '2025-08-19 07:28:41'),
(34, 34, 'Spreading investments across multiple startups to minimize risk.', 'Investor', 'n', '2025-08-19 07:28:41'),
(35, 35, 'When an investor provides additional funding to a startup in later rounds.', 'Investor', 'n', '2025-08-19 07:28:41'),
(36, 36, 'They represent successive funding rounds as a startup scales.', 'Investor', 'n', '2025-08-19 07:28:41'),
(37, 37, 'Evaluate track record, leadership, and ability to execute under pressure.', 'Investor', 'n', '2025-08-19 07:28:41'),
(38, 38, 'The order of payout investors receive in case of exit or liquidation.', 'Investor', 'n', '2025-08-19 07:28:41'),
(39, 39, 'A term sheet outlines investment terms, valuation, and equity offered.', 'Investor', 'n', '2025-08-19 07:28:41'),
(40, 40, 'Through IPOs, acquisitions, or secondary share sales.', 'Investor', 'n', '2025-08-19 07:28:41'),
(41, 41, 'Offer insights, network connections, and help them refine product and pitch.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(42, 42, 'Avoid overcommitting or giving generic advice without understanding the business.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(43, 43, 'By listening actively, respecting their vision, and providing actionable advice.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(44, 44, 'Regularly but not excessively—monthly check-ins are common.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(45, 45, 'Market knowledge, leadership guidance, investor introductions, and accountability.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(46, 46, 'Offer advice but let founders make final decisions.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(47, 47, 'By tracking startup growth, milestones, and founder confidence.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(48, 48, 'Mentors provide informal guidance, while advisors often have formal roles with equity or contracts.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(49, 49, 'Yes, but they should clarify boundaries to avoid conflicts.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(50, 50, 'Maintaining confidentiality, honesty, and avoiding exploitation.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(51, 51, 'Provide constructive feedback and respect their final decision.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(52, 52, 'Yes, mentors with domain expertise can provide deeper guidance.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(53, 53, 'Encourage resilience, help them focus on small wins, and share relevant experiences.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(54, 54, 'By introducing them to investors, experts, and potential partners.', 'Mentor', 'n', '2025-08-19 07:28:41'),
(55, 55, 'Clear communication, mutual respect, and consistency.', 'Mentor', 'n', '2025-08-19 07:28:41');

-- --------------------------------------------------------

--
-- Table structure for table `ai_faqs_q`
--

CREATE TABLE `ai_faqs_q` (
  `id` int(11) NOT NULL,
  `faq_Q` text NOT NULL,
  `type` enum('Startup','Mentor','Investor') NOT NULL,
  `removed` enum('y','n') NOT NULL DEFAULT 'n',
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ai_faqs_q`
--

INSERT INTO `ai_faqs_q` (`id`, `faq_Q`, `type`, `removed`, `created`) VALUES
(1, 'What is product-market fit?', 'Startup', 'n', '2025-08-19 07:23:39'),
(2, 'How do I raise seed funding?', 'Startup', 'n', '2025-08-19 07:23:39'),
(3, 'What is a minimum viable product (MVP)?', 'Startup', 'n', '2025-08-19 07:23:39'),
(4, 'How do I validate my startup idea?', 'Startup', 'n', '2025-08-19 07:23:39'),
(5, 'How should I choose a co-founder?', 'Startup', 'n', '2025-08-19 07:23:39'),
(6, 'What are common startup mistakes?', 'Startup', 'n', '2025-08-19 07:23:39'),
(7, 'How do I build traction?', 'Startup', 'n', '2025-08-19 07:23:39'),
(8, 'What legal steps are required to start a company?', 'Startup', 'n', '2025-08-19 07:23:39'),
(9, 'How can I protect my startup idea?', 'Startup', 'n', '2025-08-19 07:23:39'),
(10, 'What is a pitch deck?', 'Startup', 'n', '2025-08-19 07:23:39'),
(11, 'How do I manage cash flow?', 'Startup', 'n', '2025-08-19 07:23:39'),
(12, 'What is bootstrapping?', 'Startup', 'n', '2025-08-19 07:23:39'),
(13, 'When should I pivot?', 'Startup', 'n', '2025-08-19 07:23:39'),
(14, 'How do I hire my first employees?', 'Startup', 'n', '2025-08-19 07:23:39'),
(15, 'What is a cap table?', 'Startup', 'n', '2025-08-19 07:23:39'),
(16, 'What are incubators and accelerators?', 'Startup', 'n', '2025-08-19 07:23:39'),
(17, 'How do I prepare for investor meetings?', 'Startup', 'n', '2025-08-19 07:23:39'),
(18, 'What is customer churn?', 'Startup', 'n', '2025-08-19 07:23:39'),
(19, 'How do I reduce churn?', 'Startup', 'n', '2025-08-19 07:23:39'),
(20, 'How do I measure startup success?', 'Startup', 'n', '2025-08-19 07:23:39'),
(21, 'What are key startup metrics?', 'Investor', 'n', '2025-08-19 07:23:39'),
(22, 'How do I evaluate a startup?', 'Investor', 'n', '2025-08-19 07:23:39'),
(23, 'What is due diligence?', 'Investor', 'n', '2025-08-19 07:23:39'),
(24, 'What are different types of investors?', 'Investor', 'n', '2025-08-19 07:23:39'),
(25, 'What is an exit strategy?', 'Investor', 'n', '2025-08-19 07:23:39'),
(26, 'How do investors manage risk?', 'Investor', 'n', '2025-08-19 07:23:39'),
(27, 'What is SAFE agreement?', 'Investor', 'n', '2025-08-19 07:23:39'),
(28, 'What are red flags in startups?', 'Investor', 'n', '2025-08-19 07:23:39'),
(29, 'How important is market size?', 'Investor', 'n', '2025-08-19 07:23:39'),
(30, 'What is startup valuation?', 'Investor', 'n', '2025-08-19 07:23:39'),
(31, 'What is pre-money and post-money valuation?', 'Investor', 'n', '2025-08-19 07:23:39'),
(32, 'How do I negotiate equity?', 'Investor', 'n', '2025-08-19 07:23:39'),
(33, 'What is a convertible note?', 'Investor', 'n', '2025-08-19 07:23:39'),
(34, 'What is portfolio diversification?', 'Investor', 'n', '2025-08-19 07:23:39'),
(35, 'What is follow-on investment?', 'Investor', 'n', '2025-08-19 07:23:39'),
(36, 'What is the difference between Series A, B, C funding?', 'Investor', 'n', '2025-08-19 07:23:39'),
(37, 'How do I assess founder credibility?', 'Investor', 'n', '2025-08-19 07:23:39'),
(38, 'What is liquidity preference?', 'Investor', 'n', '2025-08-19 07:23:39'),
(39, 'What is a term sheet?', 'Investor', 'n', '2025-08-19 07:23:39'),
(40, 'How do investors exit?', 'Investor', 'n', '2025-08-19 07:23:39'),
(41, 'How can I guide startups?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(42, 'What should mentors avoid?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(43, 'How do I build trust with founders?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(44, 'How often should I meet startups?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(45, 'What value can mentors provide?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(46, 'How do I balance guidance with autonomy?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(47, 'How do mentors measure impact?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(48, 'What is the difference between a mentor and advisor?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(49, 'Can mentors invest in startups?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(50, 'What are ethical responsibilities of mentors?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(51, 'How do I handle disagreements with founders?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(52, 'Should mentors specialize?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(53, 'How do I motivate struggling founders?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(54, 'How can mentors expand a founder’s network?', 'Mentor', 'n', '2025-08-19 07:23:40'),
(55, 'What makes a mentor-mentee relationship successful?', 'Mentor', 'n', '2025-08-19 07:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` enum('startup','mentor','investor') NOT NULL,
  `name` varchar(100) NOT NULL,
  `startup_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `industry_type` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `name`, `startup_name`, `description`, `industry_type`, `created`, `last_updated`) VALUES
(1, 'startup', 'Tech Builder', 'Tech Builder AI Pvt Ltd', 'AI chatbot developer', 'AI', '2025-08-20 07:57:14', '2025-08-20 07:57:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_chat_history`
--
ALTER TABLE `ai_chat_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_faqs_a`
--
ALTER TABLE `ai_faqs_a`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Q_id` (`Q_id`);

--
-- Indexes for table `ai_faqs_q`
--
ALTER TABLE `ai_faqs_q`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_chat_history`
--
ALTER TABLE `ai_chat_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ai_faqs_a`
--
ALTER TABLE `ai_faqs_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `ai_faqs_q`
--
ALTER TABLE `ai_faqs_q`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ai_faqs_a`
--
ALTER TABLE `ai_faqs_a`
  ADD CONSTRAINT `ai_faqs_a_ibfk_1` FOREIGN KEY (`Q_id`) REFERENCES `ai_faqs_q` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
