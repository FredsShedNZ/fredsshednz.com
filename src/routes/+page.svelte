<!-- src/routes/+page.svelte -->
<script>
  import Header from '$lib/components/Header.svelte';
  import WatchSection from '$lib/components/WatchSection.svelte';
  import FollowSection from '$lib/components/FollowSection.svelte';
  import SupportSection from '$lib/components/SupportSection.svelte';
  import ContactSection from '$lib/components/ContactSection.svelte';
  import Footer from '$lib/components/Footer.svelte';
</script>

<svelte:head>
  <title>Fred's Shed NZ - DIY Projects, Builds & More</title>
  <meta name="description" content="Join Fred's Shed NZ for woodworking, engineering, and DIY projects. Watch tutorials, follow on social media, and join our maker community.">
</svelte:head>

<Header />

<main>
  <!-- Hero Section -->
  <section class="bg-gradient-to-r from-primary to-primary-dark text-white py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex flex-col md:flex-row items-center">
        <div class="md:w-1/2 mb-10 md:mb-0">
          <h1 class="text-4xl md:text-5xl font-bold mb-4">Welcome to Fred's Shed NZ</h1>
          <p class="text-xl mb-6">Creating, building, and exploring from the workshop to the world.</p>
          <div class="flex space-x-4">
            <a 
              href="#watch" 
              class="bg-secondary hover:bg-secondary-dark text-white font-bold py-3 px-6 rounded-lg transition-colors duration-300"
            >
              Watch Now
            </a>
            <a 
              href="#support" 
              class="bg-transparent hover:bg-white/10 text-white font-bold py-3 px-6 rounded-lg border border-white transition-colors duration-300"
            >
              Support
            </a>
          </div>
        </div>
        <div class="md:w-1/2 flex justify-center">
          <div class="bg-white p-2 rounded-lg shadow-2xl transform rotate-3">
            <div class="bg-gray-200 h-64 w-full sm:w-80 rounded flex items-center justify-center">
              <svg class="w-24 h-24 text-gray-400" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 3L4 9V21H20V9L12 3Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M9 21V12H15V21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M12 3L4 9H20L12 3Z" fill="currentColor"/>
              </svg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <WatchSection />
  <FollowSection />
  <SupportSection />
  <ContactSection />
</main>

<Footer />

<style>
  :global(html) {
    scroll-behavior: smooth;
  }
</style>
